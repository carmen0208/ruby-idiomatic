require 'open-uri'
require 'json'

def get_observation
  key = ENV['WUNDERGROUND_KEY']
  url = "http://api.wunderground.com/api/#{key}/conditions/q/PA/York.json"
  data = open(url).read
  JSON.parse(data)['current_observation']
end

def print_observation(observation)
  puts "Temperature: #{observation['temp_f']}F"
  pressure_trend = observation['pressure_trend'] == "-" ? "falling" : "rising"
  puts "Pressure: #{observation['pressure_mb']}mb and #{pressure_trend}"
  puts "Winds: #{observation['wind_string']}"
end

print_observation(get_observation)

