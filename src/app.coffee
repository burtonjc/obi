koa = require 'koa'
router = require('koa-router')()
logger = require 'koa-bunyan-logger'

require('./routes')(router)
app = koa()

app.keys = [OBI_SESSION_SECRET ? 'ObiIsAwesomelyInteligent']

app
  .use logger
    name: 'obi-server'
    level: process.env.LOG_LEVEL || 'debug'
  .use logger.requestIdContext()
  .use logger.timeContext()
  .use logger.requestLogger()
  .use require('koa-bodyparser')()
  .use router.routes()
  .use router.allowedMethods()

module.exports = app
