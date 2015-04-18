S = require 'string'

MERGE_MESSAGE_REGEX = /(?:merge|deploy)(.*)\b(?:into|to)\b\s(\S+)/

module.exports =
  caresAbout: (message) ->
    MERGE_MESSAGE_REGEX.test message

  respondTo: (message) ->
    [s, source, destination] = message.match MERGE_MESSAGE_REGEX
    source = S(source).trim().s
    destination = S(destination).trim().s
    console.log "merging '#{source}' into '#{destination}'".magenta

