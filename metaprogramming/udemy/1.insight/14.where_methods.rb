class MyClass
  def foo
    "foo"
  end
end

obj = MyClass.new

obj.methods - Object.new.methods # => [:foo]
MyClass.instance_methods(false) # => [:foo]

class MyClass
  def bar
    "bar"
  end
end

obj = MyClass.new

obj.methods - Object.new.methods # => [:foo, :bar]
MyClass.instance_methods(false) # => [:foo, :bar]


class MyClass2
  def self.bar
    
  end
  class << self
    def baz
    end
  end
end

obj2 = MyClass2.new
obj2.methods - Object.new.methods # => []
MyClass.methods - MyClass.instance_methods # => [:allocate, :new, :superclass, :<, :<=, :>, :>=, :included_modules, :include?, :name, :ancestors, :instance_methods, :public_instance_methods, :protected_instance_methods, :private_instance_methods, :constants, :const_get, :const_set, :const_defined?, :const_missing, :class_variables, :remove_class_variable, :class_variable_get, :class_variable_set, :class_variable_defined?, :public_constant, :private_constant, :singleton_class?, :include, :prepend, :module_exec, :class_exec, :module_eval, :class_eval, :method_defined?, :public_method_defined?, :private_method_defined?, :protected_method_defined?, :public_class_method, :private_class_method, :autoload, :autoload?, :instance_method, :public_instance_method]
MyClass.instance_methods(false) # => [:foo, :bar]


#Single methods
class MyClass3
end

obj3 = MyClass3.new
obj4 = MyClass3.new
def obj3.baz
  "baz"
end

obj3.baz # => "baz"

obj3.methods - Object.instance_methods # => [:baz]
obj4.methods - Object.instance_methods # => []
