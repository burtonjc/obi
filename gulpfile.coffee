gulp = require 'gulp'
mocha = require 'gulp-mocha'

gulp.task 'test', ->
  gulp.src ['spec/spec-helper.coffee', 'spec/**/*spec.coffee']
    .pipe mocha reporter: 'dot'

gulp.task 'watch', ['test'], ->
  gulp.watch ['index.coffee', 'src/**/*.coffee', 'spec/**/*.coffee'], ['test']

gulp.task 'start', ->
  {spawn} = require 'child_process'
  bunyan = spawn 'node', [], stdio: ['pipe', process.stdout, process.stderr]
  nodemon = require 'nodemon'
  S = require 'string'
  require 'colors'

  nodemon
    script: "#{__dirname}/index.coffee"
    ext: 'coffee'
    execMap:
      'coffee': 'coffee --nodejs --harmony'
    ignore: [
      'node_modules/'
      'spec/'
      'gulpfile.coffee'
    ]
    stdout: false
  .on 'restart', (file) ->
    file = S(file).chompLeft "#{__dirname}/"
    console.log "\nChange in #{file}. Restarting...\n".grey
  .on 'readable', ->
    bunyan?.kill()

    bunyan = spawn "#{__dirname}/node_modules/.bin/bunyan", ['--color']

    bunyan.stdout.pipe process.stdout
    bunyan.stderr.pipe process.stderr

    this.stdout.pipe bunyan.stdin
    this.stderr.pipe bunyan.stdin
