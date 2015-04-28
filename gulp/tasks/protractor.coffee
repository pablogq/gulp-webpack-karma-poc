gulp = require('gulp')
path = require('path')
child_process = require('child_process')
coffee = require('gulp-coffee')
gutil = require('gulp-util')

getProtractorBinary = (binaryName) ->
  winExt = if /^win/.test(process.platform) then '.cmd' else ''
  pkgPath = require.resolve('protractor')
  protractorDir = path.resolve(path.join(path.dirname(pkgPath), '..', 'bin'))
  path.join protractorDir, '/' + binaryName + winExt

gulp.task 'protractor-install', (done) ->
  child_process.spawn(getProtractorBinary('webdriver-manager'), [ 'update' ], stdio: 'inherit').once 'close', done
  return

gulp.task 'protractor-run', (done) ->
  argv = process.argv.slice(3)
  # forward args to protractor
  child_process.spawn(getProtractorBinary('protractor'), argv, stdio: 'inherit').once 'close', done
  return

gulp.task 'coffee', ->
  gulp.src('./spec-e2e/coffee/**/*.coffee').pipe(coffee(bare: true).on('error', gutil.log)).pipe gulp.dest('./spec-e2e/')
  return

gulp.task 'e2e', ['coffee', 'protractor-run']

# gulp.task 'e2e-watch',

gulp.task 'e2e-watch', ->
  gulp.watch 'spec-e2e/**/*', [ 'e2e' ]
  return
