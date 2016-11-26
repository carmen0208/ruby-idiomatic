even = -> (x) { (x % 2) == 0 }
p even.call(2) #=>true
p even.call(3) #=>false
# #call equals #===
p even === 2 #=>true
p even === 3 #=> false

num = 5
case num
when even then puts "Even"
else puts "Odd"
end

# A useful example of call equals ===
#
require 'net/http'

SUCCESS = -> (response) {(200..299) === response.code.to_i }
CLIENT_ERROR = -> (response) {(400..499) === response.code.to_i }

p response = Net::HTTP.get_response(URI.parse("http://www.baidu.com"))
#p response = Net::HTTP.get_response(URI.parse("http://www.google.com"))
p response.code
case response
when SUCCESS then puts "Success!"
when CLIENT_ERROR then puts "Client error."
else puts "Others"
end


