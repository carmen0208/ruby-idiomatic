#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---

class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new

puts obj1.class # => MyClass
puts obj2.class # => MyClass

puts MyClass.superclass #=> Object
puts MyClass.class # => Class

puts Class.class #=> Class
puts Class.superclass   # => Module
puts Module.superclass  # => Object

require_relative '../test/assertions'
assert_equals MyClass, obj1.class
assert_equals MyClass, obj2.class
assert_equals Object, MyClass.superclass
assert_equals Class, MyClass.class
assert_equals Module, Class.superclass
assert_equals Object, Module.superclass

puts Object.class
puts Module.superclass
puts Class.class

require_relative '../test/assertions'
assert_equals Object, Module.superclass
assert_equals Class, Class.class
assert_equals Class, Object.class
