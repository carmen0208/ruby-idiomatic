# Class are obejct(Classes are an instances of a class named Class)

class MyClass
end

a = MyClass.new
a.class # => MyClass
MyClass.class # => Class

## Class are objects

Myclass = Class.new
Myclass.name # => "Myclass"
Myclass.class # => Class

a = Myclass.new
a.class # => Myclass

foo = Class.new
foo.name # => nil
foo.class # => Class

Bar = foo
foo.name # => "Bar"
