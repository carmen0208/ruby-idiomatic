def event(description)
  puts "ALERT: #{description}" if yield
end

load 'metaprogramming/blocks/redflag_1/events.rb'
