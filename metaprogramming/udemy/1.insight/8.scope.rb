puts self                # main                          - Object instance

class MyClass
  puts self              # MyClass                       - MyClass class scope
  def instance_method
    puts self            #<MyClass:0x00xxxxxxxxxxxx>   - Instance of MyClass 
  end

  class << self
    puts self            #<Class:MyClass>              - MyClass's eigenclass

    def class_method
      puts self          # MyClass                       - MyClass class scope
    end
  end

  def self.class_method_2
    puts self            # MyClass                       - MyClass class scope<Paste>
  end
end

obj1 = MyClass.new       #<MyClass:0x007fde2426caa0>
obj2 = MyClass.new       #<MyClass:0x007fde24294370>

obj1.instance_method     #<MyClass:0x007fde2426caa0>   - Instance 1 of MyClass
obj2.instance_method     #<MyClass:0x007fde24294370>   - Instance 2 of MyClass

class << MyClass
  puts self              #<Class:MyClass>              - MyClass's eigenclas
end

MyClass.class_method     # MyClass                       - MyClass class scope
MyClass.class_method_2   # MyClass                       - MyClass class scope
# >> main
# >> MyClass
# >> #<Class:MyClass>
# >> #<MyClass:0x007f91df0a23a0>
# >> #<MyClass:0x007f91df0a2378>
# >> #<Class:MyClass>
# >> MyClass
# >> MyClass
