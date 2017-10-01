module MyModule
  @module_var = "module var"
  def self.module_var
    @module_var
  end
end

class MyClass

  include MyModule

  @class_var = "class var"
  def self.module_var2
    @module_var # !> instance variable @module_var not initialized
  end
end

MyModule.module_var # => "module var"

MyClass.module_var2 # => nil
MyClass.module_var # => 
# ~> -:21:in `<main>': undefined method `module_var' for MyClass:Class (NoMethodError)
