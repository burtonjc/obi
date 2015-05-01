_ = require 'lodash'

module.exports = (router) ->
  router.get '/', (next) ->
    @body = "Hi, I'm Obi."
    @status = 200
    yield next

  router.post '/messages', (next) ->
    message = @request.body.message
    plugins = [require './plugins/github']
    responses = {}

    _.each plugins, (plugin) ->
      if plugin.caresAbout message
        responses[plugin.name] = plugin.respondTo message

    @status = 200
    @body = responses

    yield next
