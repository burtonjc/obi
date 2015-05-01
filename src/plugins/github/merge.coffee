octonode = require 'octonode'
S = require 'string'

MERGE_MESSAGE_REGEX = /(?:merge|deploy)(.*)\b(?:into|to)\b\s(\S+)\b\s(?:on)(.*)/

module.exports =
  caresAbout: (message) ->
    console.log "message:#{message}".magenta
    MERGE_MESSAGE_REGEX.test message

  respondTo: (message) ->
    [s, source, destination, repoPath] = message.match MERGE_MESSAGE_REGEX
    source = S(source).trim().s
    destination = S(destination).trim().s
    console.log "merging '#{source}' into '#{destination}' on '#{repoPath}'".magenta
    "merging '#{source}' into '#{destination}' on '#{repoPath}'"

    # github = octonode.client process.env.OBI_GITHUB_TOKEN
    # github.repo(repoPath).branches (err, branches) ->
    #   console.log 'err:', err
    #   console.log 'branches:', branches
