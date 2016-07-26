#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---

puts "hello".class
puts String.class

require_relative '../test/assertions'
assert_equals String, "hello".class
assert_equals Class, String.class

# The "false" argument here means: ignore inherited methods
puts Class.instance_methods(false) # => [:allocate, :new, :superclass]

assert_equals [:allocate, :new, :superclass], Class.instance_methods(false)


puts Array.superclass  # => Object
puts Object.superclass # => BasicObject
puts BasicObject.superclass # => nil

assert_equals Object, Array.superclass
assert_equals BasicObject, Object.superclass
assert_equals nil, BasicObject.superclass

puts Class.superclass        # => Module

assert_equals Module, Class.superclass
