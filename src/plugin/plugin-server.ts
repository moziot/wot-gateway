/**
 * @module PluginServer
 *
 * Takes care of the gateway side of adapter plugins. There is
 * only a single instance of the PluginServer for the entire gateway.
 * There will be an AdapterProxy instance for each adapter plugin.
 */
/**
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import config from 'config';
import {EventEmitter} from 'events';
import {IpcSocket, Constants} from 'gateway-addon';
import * as Settings from '../models/settings';
import UserProfile from '../user-profile';
import {Message} from 'gateway-addon/lib/schema';
import WebSocket from 'ws';
import AdapterProxy from './adapter-proxy';
import APIHandlerProxy from './api-handler-proxy';
import NotifierProxy from './notifier-proxy';
import pkg from '../package.json';

const MessageType = Constants.MessageType;

const Plugin = require('./plugin');

// TODO: remove these
type AddonManager = any;

export default class PluginServer extends EventEmitter {
  private manager: AddonManager;

  private verbose?: boolean;

  private plugins: Map<string, Plugin>;

  private ipcSocket: IpcSocket;

  constructor(addonManager: AddonManager, {verbose}: {verbose?: boolean} = {}) {
    super();
    this.manager = addonManager;

    this.verbose = verbose;
    this.plugins = new Map();

    this.ipcSocket = new IpcSocket(
      true,
      config.get('ports.ipc'),
      this.onMsg.bind(this),
      'IpcSocket(plugin-server)',
      {verbose: this.verbose}
    );
  }

  public getAddonManager(): AddonManager {
    return this.manager;
  }

  /**
   * @method addAdapter
   *
   * Tells the add-on manager about new adapters added via a plugin.
   */
  addAdapter(adapter: AdapterProxy): void {
    this.manager.addAdapter(adapter);
  }

  /**
   * @method addNotifier
   *
   * Tells the add-on manager about new notifiers added via a plugin.
   */
  addNotifier(notifier: NotifierProxy): void {
    this.manager.addNotifier(notifier);
  }

  /**
   * @method addAPIHandler
   *
   * Tells the add-on manager about new API handlers added via a plugin.
   */
  addAPIHandler(handler: APIHandlerProxy): void {
    this.manager.addAPIHandler(handler);
  }

  /**
   * @method onMsg
   *
   * Called when the plugin server receives an adapter manager IPC message
   * from a plugin. This particular IPC channel is only used to register
   * plugins. Each plugin will get its own IPC channel once its registered.
   */
  onMsg(msg: Message, ws: WebSocket): void {
    this.verbose &&
      console.log('PluginServer: Rcvd:', msg);

    if (msg.messageType === MessageType.PLUGIN_REGISTER_REQUEST) {
      const plugin = this.registerPlugin(msg.data.pluginId);
      (plugin as any).ws = ws;
      let language = 'en-US';
      const units = {
        temperature: 'degree celsius',
      };
      Settings.getSetting('localization.language').then((lang) => {
        if (lang) {
          language = lang;
        }

        return Settings.getSetting('localization.units.temperature');
      }).then((temp) => {
        if (temp) {
          units.temperature = temp;
        }

        return Promise.resolve();
      }).catch(() => {
        return Promise.resolve();
      }).then(() => {
        ws.send(JSON.stringify({
          messageType: MessageType.PLUGIN_REGISTER_RESPONSE,
          data: {
            pluginId: msg.data.pluginId,
            gatewayVersion: pkg.version,
            userProfile: {
              addonsDir: UserProfile.addonsDir,
              baseDir: UserProfile.baseDir,
              configDir: UserProfile.configDir,
              dataDir: UserProfile.dataDir,
              mediaDir: UserProfile.mediaDir,
              logDir: UserProfile.logDir,
              gatewayDir: UserProfile.gatewayDir,
            },
            preferences: {
              language,
              units,
            },
          },
        }));
      });
    } else if (msg.data.pluginId) {
      const plugin = this.getPlugin(msg.data.pluginId);
      if (plugin) {
        (plugin as any).onMsg(msg);
      }
    }
  }

  /**
   * @method getPlugin
   *
   * Returns a previously loaded plugin instance.
   */
  getPlugin(pluginId: string): Plugin | undefined {
    return this.plugins.get(pluginId);
  }

  /**
   * @method loadPlugin
   *
   * Loads a plugin by launching a separate process.
   */
  loadPlugin(pluginPath: string, manifest: any): void {
    const plugin = this.registerPlugin(manifest.name);
    (plugin as any).exec = manifest.moziot.exec;
    (plugin as any).execPath = pluginPath;
    (plugin as any).start();
  }

  /**
   * @method registerPlugin
   *
   * Called when the plugin server receives a register plugin message
   * via IPC.
   */
  registerPlugin(pluginId: string): Plugin {
    let plugin = this.plugins.get(pluginId);
    if (plugin) {
      // This is a plugin that we already know about.
    } else {
      // We haven't seen this plugin before.
      plugin = new Plugin(pluginId, this);
      this.plugins.set(pluginId, plugin!);
    }
    return plugin!;
  }

  /**
   * @method unregisterPlugin
   *
   * Called when the plugin sends a plugin-unloaded message.
   */
  unregisterPlugin(pluginId: string): void {
    this.plugins.delete(pluginId);
  }

  shutdown(): void {
    this.ipcSocket.close();
  }
}
