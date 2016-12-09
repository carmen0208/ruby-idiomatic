require 'spec_helper'
require_relative '../../lib/61-70/066_caching_an_api1'
require 'webmock/rspec'

describe Weather do
  describe '#report' do
    it 'uses a cached value when available' do
      #just passing a Hash with one key, an area code, that maps to a
      #Weather::Report object containing a temperature that the real service is
      #not likely to report
      weather = Weather.new(cache: {'17361'=> Weather::Report.new(-60.0)} )
      expect(weather.report('17361').temperature).to eq(-60.0)
    end
  end
end
