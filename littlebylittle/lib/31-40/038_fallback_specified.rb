require 'ostruct'
require 'open-uri'
require 'json'

class TemperatureApiError < StandardError
end

def get_temp(query)
  key = ENV['WUNDERGROUND_KEY']
  url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
  data = open(url).read
  JSON.parse(data)['current_observation']['temp_f']
rescue => error
  if block_given?
    yield(error)
  else
    raise
  end
end

get_temp("00000") {"N/A"}
get_temp("00000") do |error|
  raise TemperatureApiError
end



