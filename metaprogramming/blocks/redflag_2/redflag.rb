def event(description)
  puts "ALERT: #{description}" if yield
end

load 'metaprogramming/blocks/redflag_2/events.rb'
