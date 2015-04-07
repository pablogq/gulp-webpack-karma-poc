gulp = require 'gulp'
karma = require('karma').server

gulp.task 'karma:ci', (callback) -> execute 'ci', callback
gulp.task 'karma:tdd', (callback) -> execute 'tdd', callback

execute = (type, callback) ->
  config = configFile: __dirname + "/../config/karma-#{type}.coffee"
  karma.start config, callback
