// This is the configuration file showing how a suite of tests might
// handle log-in using the onPrepare field.
exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',

  specs: [
    'spec-e2e/**/*.spec.js'
  ],

  directConnect: true,

  // Capabilities to be passed to the webdriver instance.
  capabilities: {
    'browserName': 'chrome'
  },

  framework: 'mocha',

  onPrepare: function() {
     global.dvr = browser.driver;
  }

};
