require 'ostruct'

observation = {
  'temp_f' => 49.0,
  'pressure_trend' => '-',
  'pressure_mb' => 981,
  'wind_string' => "From the North at 3.0 MPH Gusting to 7.0 MPH"
}

os = OpenStruct.new(observation)
os.temp_f #=> 49.0
os.wind_string #=> "From the North at 3.0 MPH Gusting to 7.0 MPH"

os.my_own_forecast = "Cluody with a chance of Godzilla"
os.my_own_forecast #=> "Cluody with a chance of Godzilla"
