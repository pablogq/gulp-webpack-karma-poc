gulp = require 'gulp'
sequence = require 'run-sequence'

gulp.task 'dist', (callback) -> sequence 'clean', 'webpack:dist', callback
