## Concepts:

#### when include, it becomes ancestor, but extend is not

```ruby
      mod.module_eval(%Q{
        def #{name}(*args)
          notify_listeners(:#{name}, *args)
        end
      })
      include mod
 
puts Dradis.ancestors
```

#### const_definded? const_get, const_set

```ruby
      # Says whether mod or its ancestors have a constant with the given name:
      mod = if const_defined?(:Events, false)
              const_get(:Events)
            else
                new_mod = Module.new do 
                  def self.to_s
                    "Events(#{instance_methods(false).join(', ')})"
                  end
                end
                #Sets the named constant to the given object, returning that object. Creates a new constant if no constant with the given name previously existed.
                const_set(:Events, new_mod)
            end
 
```

#### instance_methods
```ruby
module A
  def method1()  end
end
class B
  include A
  def method2()  end
end
class C < B
  def method3()  end
end

A.instance_methods(false)                   #=> [:method1]
B.instance_methods(false)                   #=> [:method2]
B.instance_methods(true).include?(:method1) #=> true
C.instance_methods(false)                   #=> [:method3]
C.instance_methods.include?(:method2)       #=> true<Paste>
```
