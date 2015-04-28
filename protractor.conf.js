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

  onPrepare: function() {
     global.dvr = browser.driver;
  }


  //,
  //
  // ,
  //
  // onPrepare: function() {
  //   browser.driver.get('http://localhost:8080/index.html');
  //
  //   browser.driver.findElement(by.id('username')).sendKeys('Jane');
  //   browser.driver.findElement(by.id('password')).sendKeys('1234');
  //   browser.driver.findElement(by.id('clickme')).click();
  //
  //   // Login takes some time, so wait until it's done.
  //   // For the test app's login, we know it's done when it redirects to
  //   // index.html.
  //   browser.driver.wait(function() {
  //     return browser.driver.getCurrentUrl().then(function(url) {
  //       return /index/.test(url);
  //     });
  //   });
  // },
  //
  // baseUrl: 'http://localhost:8000',
};
