module MyModule
  def module_method
    @instance_var = "changed by module method"
  end
end

class MyClass
  include MyModule

  def initialize
    @instance_var = "initialized in MyClass"
  end

  def instance_var
    @instance_var
  end
end

obj = MyClass.new

obj.instance_var # => "initialized in MyClass"
obj.module_method
obj.instance_var # => "changed by module method"
