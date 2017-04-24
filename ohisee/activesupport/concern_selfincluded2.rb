module A
  def self.included(base)
    base.extend ClassMethod
  end

  module ClassMethod
    def a_class_method
      "A class method"
    end
  end
end

class MyClass
  include A
end

p MyClass.a_class_method

module B
  def self.included(base)
    base.extend ClassMethods
    # include A's Module as well
    base.send :include, A
  end
  
  module ClassMethods
    def b_class_method
      "B class Method"
    end
  end
  include A
end

class MyClass2
  include B
end

p MyClass2.b_class_method
p MyClass2.a_class_method
