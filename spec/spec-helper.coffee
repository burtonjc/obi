chai = require 'chai'
chai.use require 'chai-as-promised'
chai.use require 'chai-things'
chai.use require 'sinon-chai'
GLOBAL.should = chai.should()
Q = require 'q'
sinon = require('sinon-as-promised') Q.Promise

before ->
  @sinon = sinon.sandbox.create()

afterEach ->
  @sinon.restore()
