koa = require 'koa'
router = require('koa-router')()
logger = require 'koa-bunyan-logger'
bunyanLogentries = require 'bunyan-logentries'

require('./routes')(router)

app = koa()

app.keys = [OBI_SESSION_SECRET ? 'ObiIsAwesomelyInteligent']

app
  .use require('koa-cors')()
  .use logger
    name: 'obi-server'
    level: process.env.LOG_LEVEL || 'debug'
    streams: [
      level: 'info'
      stream: bunyanLogentries.createStream token: process.env.OBI_LOGENTRIES_TOKEN
      type: 'raw'
    ,
      level: 'info',
      stream: process.stdout
    ]
  .use logger.requestIdContext()
  .use logger.timeContext()
  .use logger.requestLogger()
  .use require('koa-bodyparser')()
  .use router.routes()
  .use router.allowedMethods()

module.exports = app
