const RulePartBlock = require('./RulePartBlock');
const BlockConfigureDropdown = require('./BlockConfigureDropdown');

class NotifierOutletBlock extends RulePartBlock {
  constructor(ruleArea, onPresentationChange, onRuleUpdate, notifier, outlet,
              values) {
    super(ruleArea, onPresentationChange, onRuleUpdate,
          `${outlet.name} Notification`,
          '/optimized-images/thing-icons/notification.svg');

    this.notifier = notifier;
    this.outlet = outlet;
    this.values = {
      title: '',
      message: '',
      level: 0,
    };

    if (values) {
      this.values = values;
    }

    const configureContainer = this.elt.querySelector('.rule-part-info');
    this.updateValues = this.updateValues.bind(this);
    this.dropdown = new BlockConfigureDropdown(this, configureContainer);
    this.dropdown.addValue({
      id: 'title',
      title: 'Title',
      type: 'string',
      value: this.values.title,
    });
    this.dropdown.addValue({
      id: 'message',
      title: 'Message',
      type: 'string',
      value: this.values.message,
    });
    this.levels = ['Low', 'Normal', 'High'];
    this.dropdown.addValue({
      id: 'level',
      title: 'Level',
      type: 'string',
      enum: this.levels,
      value: this.levels[this.values.level],
    });
    this.updateRulePart();
  }

  updateValues(values) {
    this.values = values;
    this.values.level = this.levels.indexOf(this.values.level);
    this.updateRulePart();
    this.onRuleChange();
  }

  updateRulePart() {
    this.setRulePart({effect: {
      type: 'NotifierOutletEffect',
      notifier: this.notifier.id,
      outlet: this.outlet.id,
      title: this.values.title,
      message: this.values.message,
      level: this.values.level,
    }});
  }

  setRulePart(rulePart) {
    this.rulePart = rulePart;
    if (rulePart.trigger) {
      throw new Error('NotifierOutletBlock can only be an effect');
    }
    if (!rulePart.effect) {
      return;
    }
    this.role = 'effect';
    this.rulePartBlock.classList.add('effect');
    const effect = this.rulePart.effect;
    this.dropdown.setValue('title', effect.title);
    this.dropdown.setValue('message', effect.message);
    this.dropdown.setValue('level', this.levels[effect.level]);
  }

  remove() {
    super.remove();
    this.dropdown.remove();
  }
}

module.exports = NotifierOutletBlock;
