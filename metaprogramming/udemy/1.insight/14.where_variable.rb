class MyClass
  attr_reader :foo, :bar
  def initialize
    @foo = 'foo'
  end

  def big_bang
    @bar = "bar"
  end
end

obj = MyClass.new

obj.foo # => "foo"
obj.bar # => nil
obj.instance_variables # => [:@foo]

obj.big_bang
obj.bar # => "bar"
obj.instance_variables # => [:@foo, :@bar]

# Class Variable
class MyClass2
  @king = "you live in class"
end

#puts MyClass2.king # => 
MyClass2.instance_variables # => [:@king]
obj = MyClass2.new
obj.instance_variables # => []
