class MyClass
  attr_accessor :my_attribute
end
#is equals
class MyClass
  def my_attribute=(value)
    @my_attribute = value
  end

  def my_attribute
    @my_attribute
  end
end

obj = MyClass.new
obj.my_attribute = 'x'
p obj.my_attribute


require_relative '../test/assertions'
assert_equals "x", obj.my_attribute
