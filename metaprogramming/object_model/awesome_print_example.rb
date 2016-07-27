
#gem install "awesome_print"

require 'awesome_print'

local_time ={:city=>"Rome", :now => Time.now }
ap local_time, :indent => 2
ap Kernel.private_instance_methods.grep(/^pr/)
​# => [:printf, :print, :proc]​

# gems/awesome_print.../lib/awesome_print/core_ext/kernel.rb
# module Kernel
#   def ap(object, options={})
#     #
#   end
# end
# After this foray into Ruby modules and the Kernel,
# you can finally learn how Ruby executes methods after finding them.
