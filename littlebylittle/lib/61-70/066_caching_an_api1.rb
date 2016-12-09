require 'open-uri'
require 'json'

class Weather 

  Report = Struct.new(:temperature)

  def initialize(options={})
    @cache = options.fetch(:cache) { {} }
  end
  
  def report(query)
    #key  = ENV['WUNDERGROUND_KEY']
    @cache.fetch(query) {
      key  = 'a7aac5474eb9d861'
      url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
      body = open(url).read
      data = JSON.parse(body)  # => cache
      Report.new(data['current_observation']['temp_f'])
    }
  end
end

Weather.new.report(17361) 
 # => 
# ~> -:7: dynamic constant assignment
# ~>     Report = Struct.new(:temperature)
# ~>             ^
