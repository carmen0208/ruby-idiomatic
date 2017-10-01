class Parent
end

class Child < Parent
end

Child.superclass # => Parent
object = Parent.superclass # => Object
basicObject = object.superclass # => BasicObject
basicObject.superclass # => nil
