merge = require './merge'

class GitHubPlugin
  @caresAbout: (message) ->
    merge.caresAbout message

  @respondTo: (message) ->
    if merge.caresAbout message
      merge.respondTo message

module.exports = GitHubPlugin
