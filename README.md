# Gulp + Webpack + Karma Proof of Concept

This is a small proof of concept to try [Gulp][gulp], [Webpack][webpack] and [Karma][karma] working together.

## Setup

Install [Gulp][gulp] globally if you haven't:

```
$ npm install -g gulp
```

Now clone the repo, when it finishes, you should install the dependencies running the following command in the root directory of the project:

```
$ npm install
```

### Gulp Tasks

Now that you have the dependencies installed you can execute gulp tasks that will relay on [Webpack][webpack] and [Karma][karma] to build or run the application and execute the specs.

This is the list of available tasks:


**dev**
  > build the application and runs it in a dev server (webpack-dev-server).

**dist**
  > build a distribution version of the application.

**tdd**
  > executes specs and watches for changes.

**ci**
  > executes specs one time. (useful for CI scenarios). [PhantomJS]

**clean**
  > remove distribution directory.

You can execute any task like this:



```
$ gulp [task-name]
```

_Note: If you execute the default task (running gulp command without any task), a help message will be displayed._

So to run the application in the dev server you can execute:

```
$ gulp dev
```

## e2e Testing
Uses *Protractor* for e2e tests. Specs are found in spec-e2e/**/*/js. Specs can be written in coffeescript and can be found in spec-e2e/coffee.

### Gulp Tasks for e2e

**Gulp protractor e2e testing tasks: ** ./gulp/tasks/protractor.coffeee

**protractor-install**
  > installs/updates webdriver

**protractor-run**
  > run the tests specified in the config file '_protractor.conf.js_'

**coffee**
  > compile coffeescript in spec-e2e/coffee/ and puts the compiled javascript in spec-e2e/

**e2e**
  > runs coffee followed by protractor run

**e2e-watch**
  > runs e2e task when files in spec-e2e/ are changed

run test suite listed in protractor.conf.js once:
```
$ gulp e2e
```

watch for any changes changes to the spec files.
```
$ gulp e2e-watch
```

## Configuration

### Webpack

You can find the configuration for [Webpack][webpack] in:

`~/gulp/config/webpack.coffee`

This is the content of the config file:

``` coffee
  entry:
    app: [
      './src/styles/webpack-gulp-poc.sass'
      './src/scripts/main.coffee'
    ]
  output:
    path: path.join __dirname, 'assets'
    publicPath: '/assets/'
    filename: '[name].js'
    chunkFilename: '[name].[id].[chunkhash].js'
  resolve:
    extensions: [
      ''
      '.web.coffee', '.web.js', '.web.sass', '.web.css'
      '.coffee', '.js', 'sass', 'css'
    ]
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'}
      {test: /\.css$/, loader: 'style!css'}
      {test: /\.sass$/, loader: 'style!css!sass'}
    ]
```

As you can see, it has a basic webpack configuration, but you can easily add advance features.

### Karma

[Karma][karma] configuration is slightly different. It is divided in three files:

- _karma_: shared configuration  
  `~/gulp/config/karma.coffee`
  ``` coffee
  basePath: '',
  files: [
    '../../spec/*.spec.coffee'
    '../../spec/**/*.spec.coffee'
  ]
  frameworks: ['mocha', 'sinon-chai']
  preprocessors:
    '../../spec/*.spec.coffee': ['webpack']
    '../../spec/**/*.spec.coffee': ['webpack']
  webpack:
    resolve:
      extensions: ['', '.js', '.coffee']
    module:
      loaders: [{ test: /\.coffee$/, loader: 'coffee-loader' }]
  webpackMiddleware:
    stats:
      colors: true
  client:
    captureConsole: true
    mocha:
      bail: true
  reporters: ['spec']
  port: 9876
  colors: true
  autoWatch: true
  plugins: [
    require 'karma-mocha'
    require 'karma-sinon-chai'
    require 'karma-spec-reporter'
    require 'karma-webpack'
  ]

  ```

- _karma-tdd_: used by `tdd` gulp task
  `~/gulp/config/karma-tdd.coffee`
  ``` coffee
  karma = require './karma'
  tdd =
    browsers: ['Chrome']
    singleRun: false
    plugins: [
      require 'karma-chrome-launcher'
    ]

  module.exports = (config) -> config.set merge(karma, tdd)
  ```
- _karma-ci_: used by `ci` gulp task
  `~/gulp/config/karma-ci.coffee`
  ``` coffee
  karma = require './karma'
  ci =
    browsers: ['PhantomJS']
    singleRun: true
    plugins: [
      require 'karma-phantomjs-launcher'
    ]

  module.exports = (config) -> config.set merge(karma, ci)
  ```

[gulp]: http://gulpjs.com/
[webpack]: http://webpack.github.io/
[karma]: http://karma-runner.github.io/0.12/index.html
