/**
 * Gateway Model.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
'use strict';

const API = require('../api').default;
const Constants = require('../constants');
const Model = require('./model');
const ReopeningWebSocket = require('./reopening-web-socket');
const ThingModel = require('./thing-model');

class GatewayModel extends Model {
  constructor() {
    super();
    this.thingModels = new Map();
    this.things = new Map();
    this.connectedThings = new Map();
    this.directories = new Map();
    this.onMessage = this.onMessage.bind(this);
    this.queue = Promise.resolve(true);
    this.connectWebSocket();
    return this;
  }

  addQueue(job) {
    this.queue = this.queue.then(job).catch((e) => {
      console.error(e);
    });
    return this.queue;
  }

  subscribe(event, handler, immediate = false) {
    super.subscribe(event, handler);
    switch (event) {
      case Constants.REFRESH_THINGS:
        if (immediate) {
          handler(this.things, this.directories);
        }
        break;
      case Constants.DELETE_THINGS:
        break;
      case Constants.DELETE_DIRECTORIES:
        break;
      default:
        console.warn(`GatewayModel does not support event:${event}`);
        break;
    }
  }

  setThing(thingId, description) {
    if (this.thingModels.has(thingId)) {
      const thingModel = this.thingModels.get(thingId);
      thingModel.updateFromDescription(description);
    } else {
      const thingModel = new ThingModel(description, this.ws);
      thingModel.subscribe(Constants.DELETE_THING, this.handleRemove.bind(this));
      if (this.connectedThings.has(thingId)) {
        thingModel.onConnected(this.connectedThings.get(thingId));
      }
      this.thingModels.set(thingId, thingModel);
    }
    this.things.set(thingId, description);
  }

  getThing(thingId) {
    if (this.thingModels.has(thingId) && this.things.has(thingId)) {
      return Promise.resolve(this.things.get(thingId));
    }
    return this.refreshThing(thingId).then(() => {
      return this.things.get(thingId);
    });
  }

  getThingModel(thingId) {
    if (this.thingModels.has(thingId)) {
      return Promise.resolve(this.thingModels.get(thingId));
    }
    return this.refreshThing(thingId).then(() => {
      return this.thingModels.get(thingId);
    });
  }

  /**
   * Remove the thing.
   *
   * @param {string} thingId - Id of the thing
   */
  removeThing(thingId) {
    if (!this.thingModels.has(thingId)) {
      return Promise.reject(`No Thing id:${thingId}`);
    }
    return this.addQueue(() => {
      if (!this.thingModels.has(thingId)) {
        throw new Error(`Thing id:${thingId} already removed`);
      }
      const thingModel = this.thingModels.get(thingId);
      return thingModel.removeThing();
    });
  }

  /**
   * Update the thing.
   *
   * @param {string} thingId - Id of the thing
   * @param {object} updates - contents of update
   */
  updateThing(thingId, updates) {
    if (!this.thingModels.has(thingId)) {
      return Promise.reject(`No Thing id:${thingId}`);
    }
    return this.addQueue(() => {
      if (!this.thingModels.has(thingId)) {
        throw new Error(`Thing id:${thingId} already removed`);
      }
      const thingModel = this.thingModels.get(thingId);
      return thingModel.updateThing(updates).then(() => {
        this.refreshThing(thingId);
      });
    });
  }

  handleRemove(thingId, skipEvent = false) {
    if (this.thingModels.has(thingId)) {
      this.thingModels.get(thingId).cleanup();
      this.thingModels.delete(thingId);
    }
    if (this.things.has(thingId)) {
      this.things.delete(thingId);
    }

    if (!skipEvent) {
      return this.handleEvent(Constants.DELETE_THINGS, this.things, this.directories);
    }
  }

  connectWebSocket() {
    const thingsHref = `${window.location.origin}/things?jwt=${API.jwt}`;
    const wsHref = thingsHref.replace(/^http/, 'ws');
    this.ws = new ReopeningWebSocket(wsHref);
    this.ws.addEventListener('open', this.refreshThings.bind(this));
    this.ws.addEventListener('message', this.onMessage);
    const directoriesHref = `${window.location.origin}/directories?jwt=${API.jwt}`;
    const directoriesWsHref = directoriesHref.replace(/^http/, 'ws');
    this.directoriesWs = new ReopeningWebSocket(directoriesWsHref);
    this.directoriesWs.addEventListener('open', this.refreshThings.bind(this));
    this.directoriesWs.addEventListener('message', this.onMessage);
  }

  onMessage(event) {
    const message = JSON.parse(event.data);

    switch (message.messageType) {
      case 'connected':
        this.connectedThings.set(message.id, message.data);
        break;
      case 'thingAdded':
        this.refreshThings();
        break;
      case 'thingModified':
        this.refreshThing(message.id);
        break;
      case 'directoryAdded':
      case 'directoryModified':
      case 'directoryRemoved':
      case 'layoutModified':
        this.refreshThings();
        break;
      default:
        break;
    }
  }

  refreshThings() {
    return this.addQueue(() => {
      return API.getThings()
        .then((things) => {
          const fetchedIds = new Set();
          things.forEach((description) => {
            const thingId = decodeURIComponent(description.href.split('/').pop());
            fetchedIds.add(thingId);
            this.setThing(thingId, description);
          });

          const removedIds = Array.from(this.thingModels.keys()).filter((id) => {
            return !fetchedIds.has(id);
          });

          removedIds.forEach((thingId) => this.handleRemove(thingId, true));

          return API.getDirectories();
        })
        .then((directories) => {
          const fetchedIds = new Set();
          directories.forEach((description) => {
            const directoryId = decodeURIComponent(description.href.split('/').pop());
            fetchedIds.add(directoryId);
            this.setDirectory(directoryId, description);
          });

          const removedIds = Array.from(this.directories.keys()).filter((id) => {
            return !fetchedIds.has(id);
          });

          removedIds.forEach((directoryId) => this.handleRemoveDirectory(directoryId, true));
          return this.handleEvent(Constants.REFRESH_THINGS, this.things, this.directories);
        })
        .catch((e) => {
          console.error(`Get things or directories failed ${e}`);
        });
    });
  }

  refreshThing(thingId) {
    return this.addQueue(() => {
      return API.getThing(thingId)
        .then((description) => {
          if (!description) {
            throw new Error(`Unavailable Thing Description: ${description}`);
          }
          this.setThing(thingId, description);
          return this.handleEvent(Constants.REFRESH_THINGS, this.things, this.directories);
        })
        .catch((e) => {
          console.error(`Get thing id:${thingId} failed ${e}`);
        });
    });
  }

  setDirectory(directoryId, description) {
    this.directories.set(directoryId, description);
  }

  getDirectory(directoryId) {
    if (this.directories.has(directoryId)) {
      return Promise.resolve(this.directories.get(directoryId));
    }
    return this.refreshDirectory(directoryId).then(() => {
      return this.directories.get(directoryId);
    });
  }

  /**
   * Remove the directory.
   *
   * @param {string} directoryId - Id of the directory
   */
  removeDirectory(directoryId) {
    if (!this.directories.has(directoryId)) {
      return Promise.reject(`No directory id:${directoryId}`);
    }
    return this.addQueue(() => {
      if (!this.directories.has(directoryId)) {
        throw new Error(`Directory id:${directoryId} already removed`);
      }
      return API.removeDirectory(directoryId).then(() => {
        return this.handleEvent(Constants.DELETE_DIRECTORIES, this.things, this.directories);
      });
    });
  }

  /**
   * Add a new directory.
   *
   * @param {string} title - title of the directory
   */
  addDirectory(title) {
    return this.addQueue(() => {
      return API.addDirectory(title).then((directory) => {
        const directoryId = decodeURIComponent(directory.href.split('/').pop());
        return directoryId;
      });
    });
  }

  /**
   * Update the directory.
   *
   * @param {string} directoryId - Id of the directory
   * @param {object} updates - contents of update
   */
  updateDirectory(directoryId, updates) {
    if (!this.directories.has(directoryId)) {
      return Promise.reject(`No directory id:${directoryId}`);
    }
    return this.addQueue(() => {
      if (!this.directories.has(directoryId)) {
        throw new Error(`Directory id:${directoryId} already updated`);
      }
      const directory = this.directories.get(directoryId);
      return directory.updateDirectory(updates).then(() => {
        this.refreshDirectory(directoryId);
      });
    });
  }

  handleRemoveDirectory(directoryId, skipEvent = false) {
    if (this.directories.has(directoryId)) {
      this.directories.delete(directoryId);
    }
    if (!skipEvent) {
      return this.handleEvent(Constants.DELETE_DIRECTORIES, this.things, this.directories);
    }
  }
}

module.exports = GatewayModel;
