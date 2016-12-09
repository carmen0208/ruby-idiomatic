require 'open-uri'
require 'json'

class Weather 

  Report = Struct.new(:temperature)

  def initialize(options={})
    @cache = options.fetch(:cache) { {} }
  end
  
  def report(query)
    #key  = ENV['WUNDERGROUND_KEY']
    key  = 'a7aac5474eb9d861'
    url = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
    body = @cache.fetch(query) {
      @cache[query] = open(url).read
    }
    data = JSON.parse(body)  # => {"response"=>{"version"=>"0.1", "termsofService"=>"http://www.wunderground.com/weather/api/d/terms.html", "features"=>{"conditions"=>1}}, "current_observation"=>{"image"=>{"url"=>"http://icons.wxug.com/graphics/wu2/logo_130x80.png", "title"=>"Weather Underground", "link"=>"http://www.wunderground.com"}, "display_location"=>{"full"=>"Shrewsbury, PA", "city"=>"Shrewsbury", "state"=>"PA", "state_name"=>"Pennsylvania", "country"=>"US", "country_iso3166"=>"US", "zip"=>"17361", "magic"=>"1", "wmo"=>"99999", "latitude"=>"39.77000046", "longitude"=>"-76.68000031", "elevation"=>"300.2"}, "observation_location"=>{"full"=>"Shrewsbury, PA, Shrewsbury, Pennsylvania", "city"=>"Shrewsbury, PA, Shrewsbury", "state"=>"Pennsylvania", "country"=>"US", "country_iso3166"=>"US", "latitude"=>"39.769199", "longitude"=>"-76.681358", "elevation"=>"988 ft"}, "estimated"=>{}, "station_id"=>"KPASHREW5", "observation_time"=>"Last Updated on December 9, 6:33 PM EST", "observation_time_rfc822"=>"Fri, 09 Dec 2016 18:33:17 -0500", "observation_epoch"=>"1481326397", "local_time_rfc822"=>"Fri, 09 Dec 2016 18:33:19 -0500", "local_epoch"=>"1481326399", "local_tz_short"=>"EST", "local_tz_long"=>"America/New_York", "local_tz_offset"=>"-0500", "weather"=>"Clear", "temperature_string"=>"27.3 F (-2.6 C)", "temp_f"=>27.3, "temp_c"=>-2.6, "relative_humidity"=>"65%", "wind_string"=>"From the West at 8.3 MPH", "wind_dir"=>"West", "wind_degrees"=>270, "wind_mph"=>8.3, "wind_gust_mph"=>0, "wind_kph"=>13.4, "wind_gust_kph"=>0, "pressure_mb"=>"1028", "pressure_in"=>"30.36", "pressure_trend"=>"+", "dewpoint_string"=>"17 F (-8 C)", "dewpoint_f"=>17, "dewpoint_c"=>-8, "heat_index_string"=>"NA", "heat_index_f"=>"NA", "heat_index_c"=>"NA", "windchill_string"=>"19 F (-7 C)", "windchill_f"=>"19", "windchill_c"=>"-7", "feelslike_string"=>"19 F (-7 C)", "feelslike_f"=>"19", "feelslike_c"=>"-7", "visibility_mi"=>"10.0", "visibility_km"=>"16.1", "solarradiation"=>"--", "UV"=>"0", "precip_1hr_string"=>"-999.00 in ( 0 mm)", "precip_1hr_in"=>"-999.00", "precip_1hr_metric"=>" 0", "precip_today_string"=>"0.00 in (0 mm)", "precip_today_in"=>"0.00", "precip_today_metric"=>"0", "icon"=>"clear", "icon_url"=>"http://icons.wxug.com/i/c/k/nt_clear.gif", "forecast_url"=>"http://www.wunderground.com/US/PA/Shrewsbury.html", "history_url"=>"http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KPASHREW5", "ob_url"=>"http://www.wunderground.com/cgi-bin/findweather/getForecast?query=39.769199,-76.681358", "nowcast"=>""}}
    Report.new(data['current_observation']['temp_f'])
  end
end

require 'moneta'

cache = Moneta.new(:YAML, file: "weather.yaml", expires: 300)
Weather.new(cache: cache).report(17361) 
 # => #<struct Weather::Report temperature=27.3>
