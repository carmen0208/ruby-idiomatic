require 'spec_helper'
require_relative '../../lib/61-70/066_caching_an_api2'
require 'webmock/rspec'

describe Weather do
  describe '#report' do
    it 'uses a cached value when available' do
      #just passing a Hash with one key, an area code, that maps to a
      #Weather::Report object containing a temperature that the real service is
      #not likely to report
      json = '{"current_observation": {"temp_f": -60.0}}'
      weather = Weather.new(cache: {'17361'=> json })
      expect(weather.report('17361').temperature).to eq(-60.0)
    end
    it 'populates the cache with new values' do 
      json = '{ "current_observation": { "temp_f": -60.0 } }'
      expected_url = 
        %r(http://api.wunderground.com/api/.*/conditions/q/17361.json)
      stub_request(:get, expected_url).to_return(body: json)
      cache = {}
      weather = Weather.new(cache:cache)
      weather.report('17361')
      expect(cache['17361']).to eq(json)
    end
  end
   
end
