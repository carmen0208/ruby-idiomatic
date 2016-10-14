require 'open-uri'
require 'cgi'
require 'nokogiri'

# The hash key is the name of geographical region. If the key hasn’t been referenced before, the weather temperature for that region is fetched.
temperature = Hash.new do |h,town|
  url = "http://www.google.com/ig/api?weather=" +
    CGI.escape(town)
  h[town] = open(url) do |body|
    Nokogiri::XML(body).
      at_css('current_conditions temp_f')['data']
  end
end

temperature['Shrewsbury, PA'] 
