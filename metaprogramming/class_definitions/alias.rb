#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
class MyClass
  def my_method
    'my_method()'
  end
  alias_method :m, :my_method
end

obj = MyClass.new
p obj.my_method
p obj.m

require_relative '../test/assertions'
assert_equals "my_method()", obj.my_method
assert_equals "my_method()", obj.m

class MyClass
  alias_method :m2, :m
end

p obj.m2

assert_equals "my_method()", obj.m2
