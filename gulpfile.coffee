gulp = require 'gulp'
mocha = require 'gulp-mocha'

gulp.task 'test', ->
  gulp.src ['spec/spec-helper.coffee', 'spec/**/*spec.coffee']
    .pipe mocha reporter: 'dot'

gulp.task 'watch', ['test'], ->
  gulp.watch ['index.coffee', 'src/**/*.coffee', 'spec/**/*.coffee'], ['test']
