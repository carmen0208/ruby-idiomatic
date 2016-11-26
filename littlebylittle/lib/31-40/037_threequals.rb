p /\A\d+\z/ === "54321"  #=> true  #=> \A means start point \z means end point
p (0...10) === 5   #=> true
p Numberic === 123 #=> true

# the threequals is used under the hood by case statements.


case obj
when /\A\d+\z/
  puts "A numeric string"
when 0..10
  puts "A positive integer under 10"
when Numberic
  puts "A number"
end


