require 'ostruct'
require 'open-uri'
require 'json'

# 1 options to throw error
class TemperatureApiError < StandardError
end
def get_temp(query)
  key = ENV['WUNDERGROUND_KEY']
  url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
  data = open(url).read
  JSON.parse(data)['current_observation']['temp_f']
rescue => error
  raise TemperatureApiError.new(error.message)
end

# 2 options to throw error(someone don't want to raise exception)
def get_temp(query)
  key = ENV['WUNDERGROUND_KEY']
  url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
  data = open(url).read
  JSON.parse(data)['current_observation']['temp_f']
rescue => error
  reture "N/A"
end
