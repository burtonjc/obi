process.env.PORT ?=  4001

require 'colors'
app = require './src/app'

server = app.listen process.env.PORT, ->
  host = server.address().address
  host = 'localhost' if host is '::'
  port = server.address().port
  console.log 'Application running at'.grey, "#{host}:#{port}".grey.bold
