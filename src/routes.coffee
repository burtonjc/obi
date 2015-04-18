_ = require 'lodash'

module.exports = (router) ->
  router.get '/', (next) ->
    @body = "Hi, I'm Obi."
    @status = 200
    yield next

  router.post '/message', (next) ->
    message = @request.body.message
    plugins = [require './plugins/github']

    _.each plugins, (plugin) ->
      if plugin.caresAbout message
        plugin.respondTo message

    @status = 200
    yield next
