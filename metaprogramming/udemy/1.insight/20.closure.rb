foo = "foo in the top level"

my_block = lambda do |x|
  puts x
  puts foo
end

class MyClass
  def initialize(&block)
    @block = block
    @instance_var = "MyClass Instance Var"
  end

  def bar 
    @block.call(@instance_var)
  end
end

baz = MyClass.new(&my_block)
baz.bar # => nil
foo = "foo has been changed"

baz.bar # => nil


# >> MyClass Instance Var
# >> foo in the top level
# >> MyClass Instance Var
# >> foo has been changed
