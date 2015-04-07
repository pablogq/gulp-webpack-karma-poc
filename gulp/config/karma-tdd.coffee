merge = require 'deepmerge'

karma = require './karma'
tdd =
  browsers: ['Chrome']
  singleRun: false
  plugins: [
    require 'karma-chrome-launcher'
  ]

module.exports = (config) -> config.set merge(karma, tdd)
