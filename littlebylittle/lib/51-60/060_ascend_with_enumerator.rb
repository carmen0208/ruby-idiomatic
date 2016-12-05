require 'pathname'
p = Pathname.new('../gemlove/lib/rubygems/commands')
p.ascend do |path|
  puts path
end
# >> ./gemlove/lib/rubygems/commands
# >> ./gemlove/lib/rubygems
# >> ./gemlove/lib
# >> ./gemlove
# >> .
