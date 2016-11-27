require 'ostruct'
require 'open-uri'
require 'json'

class TemperatureApiError < StandardError
end

DEFAULT_FALLBACK = ->(error) {raise}

def get_temp(query, &fallback)
  fallback ||= DEFAULT_FALLBACK
  puts fallback
  key = ENV['WUNDERGROUND_KEY']
  url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
  data = open(url).read
  JSON.parse(data)['current_observation']['temp_f']
rescue => error
  fallback.call(error)
end

#get_temp("00000") {"N/A"}
get_temp("00000") do |error|
  raise TemperatureApiError
end

