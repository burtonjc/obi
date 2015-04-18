koa = require 'koa'
router = require('koa-router')()
require('./routes')(router)

app = koa()

app.keys = [OBI_SESSION_SECRET ? 'ObiIsAwesomelyInteligent']

app
  .use require('koa-log4js')()
  .use require('koa-bodyparser')()
  .use router.routes()
  .use router.allowedMethods()

module.exports = app
