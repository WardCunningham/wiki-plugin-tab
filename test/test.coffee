# build time tests for tab plugin
# see http://mochajs.org/

tab = require '../client/tab'
expect = require 'expect.js'

describe 'tab plugin', ->

  describe 'expand', ->

    it 'can make itallic', ->
      result = tab.expand 'hello *world*'
      expect(result).to.be 'hello <i>world</i>'
