module.exports =
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
