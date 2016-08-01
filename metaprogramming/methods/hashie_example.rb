#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
require 'hashie'

icecream = Hashie::Mash.new
icecream.flavor = "strawberry"
icecream.flavor                 # => "strawberry"

require_relative '../test/assertions'
assert_equals "strawberry", icecream.flavor

# in hashie gem:
# def method_missing(method_name, *args, &blk)
#   return self.[](method_name, &blk) if key?(method_name)
#   match = method_name.to_s.match(/(.*?)([?=!]?)$/)
#   case match[2]
#   when "="
#     self[match[1]] = args.first
#     # ...
#   when "?"
#     !!self[match[1]]
#   when "!"
#     initializing_reader(match[1])
#   else
#     default(method_name, *args, &blk)
#   end
# end
