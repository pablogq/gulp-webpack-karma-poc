del = require 'del'
gulp = require 'gulp'

gulp.task 'clean', (callback) -> del ['./dist/**'], callback
