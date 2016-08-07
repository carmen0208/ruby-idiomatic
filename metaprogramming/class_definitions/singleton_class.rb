#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
an_object = Object.new

p an_object

class << an_object
  # your code here
end

obj = Object.new

singleton_class = class << obj
  self
end

p singleton_class

p singleton_class.class #=> Class

def obj.my_singleton_method
end
p singleton_class.instance_methods.grep(/my_/)  # => [:my_singleton_method]

p "abc".singleton_class

require_relative '../test/assertions'
assert_equals Class, singleton_class.class
assert_equals [:my_singleton_method], singleton_class.instance_methods.grep(/my_/)
assert_matches "#\<Class:#\<String:0x\\w+\>\>", "abc".singleton_class
