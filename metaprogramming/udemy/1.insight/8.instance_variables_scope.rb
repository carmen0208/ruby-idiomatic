ass MyClass
    @foo = "Instance variable created in 'MyClass' scope"
    def initialize
        @bar = "Created in the MyClass instance scope"
    end
    def instance_method
        # Can only access @bar and not @foo. Because 'self' here
        # refers to an 'instance of the class' and this self != MyClass.
        @foo            # Returns: nil
        @bar            # Returns: "Created in the MyClass instance scope"
    end
    def another_instance_method
        # Can call 'instance_method' without explicit object.
        instance_method
        self.instance_method    # Same thing as above
        # Have to use explicit message receiver to call 'class_method'.
        # Because 'self' here isn't equal to 'MyClass'.
        MyClass.class_method
    end
    def self.class_method
        # 'self' in class methods however is equal to the class (self = MyClass).
        # So, here we can access everything defined when 'self' was equal to 'MyClass'.
        @foo            # Returns: "Instance variable created in 'MyClass' scope"
        @bar            # Returns: nil
    end
    def self.another_class_method
        # Can't call 'instance_method' without getting a reference to an instance.
        instance_method         # Will look for class method with name 'instance_method'.
        # Don't need to use explicit message receiver to call class methods.
        # Because 'self' here is equal to 'MyClass'.
        class_method
        self.class_method       # Same thing as above
    end
end
class << MyClass
    # 'self' here is an eigenclass. So we can't access class instances vars or methods.
    def some_method
        # 'self' here is 'MyClass'. So, we can access all class instance
        # variables and methods that were defined while self was equal to MyClass.
        class_method            # Can access class methods.
        @foo                    # Can access @foo, but not @bar
    end
end
