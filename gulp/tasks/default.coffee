gulp = require 'gulp'

gulp.task 'default', ->
  help = """
    Usage: gulp [command]

    Comands:
      dev     # build the application and runs it in a dev server
      dist    # build a distribution version of the application
      tdd     # executes specs and watches for changes
      ci      # executes specs one time (useful for CI scenarios)
      clean   # remove dist directory
  """
  console.log help
