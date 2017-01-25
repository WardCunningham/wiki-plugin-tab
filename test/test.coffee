# build time tests for tab plugin
# see http://mochajs.org/

tab = require '../client/tab'
expect = require 'expect.js'

describe 'tab plugin', ->

  describe 'encode', ->

    it 'can encode like wikipedia', ->
      result = tab.encode "Data:Bls.gov/US Women's weekly earnings as a percent of men's by age, annual averages.tab"
      expect(result).to.be 'Bls.gov/US_Women%27s_weekly_earnings_as_a_percent_of_men%27s_by_age,_annual_averages'
