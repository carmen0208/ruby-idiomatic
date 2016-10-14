require "net/http"
require 'cgi'

class Cowsays
  def `(url)
    URI.parse(url)
  end

  def say(message)
    message = CGI.escape(message)
    Net::HTTP.get_print(`http://www.cowsays.com/cowsay?message=#{message}`)
  end
end

Cowsays.new.say "Hello, Ruby !"

#=>  _______________
#=> < Hello, Ruby ! >
#=>  ---------------
#=>         \   ^__^
#=>          \  (oo)\_______
#=>             (__)\       )\/\
#=>                 ||----w |
#=>                 ||     ||
