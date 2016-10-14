
puts "\#literal syntax in Ruby"
puts "* literal integers: #{42}" 
puts "* floating point numbers: #{3.14159}"
puts "* strings:" + "foo"
puts "* hexidecimal: 0x7FFF is: #{0x7FFF}" 
puts "* octal numbers: 0755 is #{0755}" 
puts "#Octal numbers are useful for things like specifying unix file permissions."

require 'fileutils'
include FileUtils
 
chmod 0755, 'README.md'
perms = 0b111101101
perms.to_s(8) #=> 0755
puts chmod perms, 'README.md' #=> equals chmod 0755
