module MyModule
  puts self
  def module_method
    puts self
  end

  def self.module_class_method
    puts self
  end
end

class MyClass
  include MyModule

  def instance_method
    puts self
  end

  def self.class_method
    puts self
  end
end

obj = MyClass.new
obj.instance_method # => nil
obj.module_method # => nil

MyClass.class_method # => nil
MyModule.module_class_method # => nil
# >> MyModule
# >> #<MyClass:0x007fe64410d9c0>
# >> #<MyClass:0x007fe64410d9c0>
# >> MyClass
# >> MyModule
