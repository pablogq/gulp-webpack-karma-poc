clone = require 'clone'
gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'
#creating a copy of the config object to safely modify it.
config = clone require('../config/webpack')

config.output.path = './dist/'
config.plugins or= []
config.plugins = config.plugins.concat [
  new webpack.optimize.DedupePlugin()
  new webpack.optimize.UglifyJsPlugin()
]

gulp.task 'webpack:dist', (callback) ->
  webpack config, (err, stats) ->
    throw new gutil.PluginError('webpack:dist', err) if err
    gutil.log '[webpack:dist]', stats.toString(colors: true)
    callback()
