merge = require 'deepmerge'

karma = require './karma'
ci =
  browsers: ['PhantomJS']
  singleRun: true
  plugins: [
    require 'karma-phantomjs-launcher'
  ]

module.exports = (config) -> config.set merge(karma, ci)
