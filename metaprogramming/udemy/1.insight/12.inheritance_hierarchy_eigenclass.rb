class Parent
end

class Child < Parent
end

Child.superclass # => Parent
Parent.superclass # => Object
Object.superclass # => BasicObject

che = class << Child
      self
      end

che2 = Child.singleton_class 
sup = che.superclass # => #<Class:Parent>
sup = sup.superclass # => #<Class:Object>
sup = sup.superclass # => #<Class:BasicObject>
sup = sup.superclass # => Class
sup = sup.superclass # => Module
sup = sup.superclass # => Object
sup = sup.superclass # => BasicObject
sup = sup.superclass # => nil

sup = che2.superclass # => #<Class:Parent>
