class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
puts obj.class   # => MyClass

puts obj.my_method
puts obj.instance_variables # => [:@v]

require_relative "../test/assertions"
assert_equals [:@v], obj.instance_variables

puts obj.methods.grep(/my/)  # => [:my_method]

ssert_equals [:my_method], obj.methods.grep(/my/)

puts String.instance_methods == "abc".methods    # => true
puts String.methods == "abc".methods             # => false

assert_equals "abc".methods, String.instance_methods
assert_false "abc".methods == String.methods
