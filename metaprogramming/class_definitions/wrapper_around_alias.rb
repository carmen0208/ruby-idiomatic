#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
   end
end

p "War and Peace".length      # => "long"
p "War and Peace".real_length # => 13

require_relative '../test/assertions'
assert_equals "long", "War and Peace".length
assert_equals 13, "War and Peace".real_length

#real world case: rake2thor
# module Kernel
#   def require_with_record(file)
#     $requires << file if caller[1] =~ /rake2thor:/
#     require_without_record file
#   end
#   alias_method :require_without_record, :require
#   alias_method :require, :require_with_record
# end
#=
# module Kernel
#   alias_method :require_without_record, :require
#   def require(file)
#     $requires << file if caller[1] =~ /rake2thor:/
#     require_without_record file
#   end
# end
