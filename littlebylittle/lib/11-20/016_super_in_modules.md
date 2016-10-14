##Check if an class has a super class in a included Module

```ruby
module YeOlde
  def hello(subject="World")
    if definded?(super)
      super
    else
      #do something
    end

  end
end
```

[example](016_super_in_modules.rb)

###How to make sure send method is the orignial one

1. solution1
  ```ruby
  __send__
  ```
2. solution2

  ```ruby
  module Logged
    def logged_send(name, *args, &block)
      puts "Sending #{name}(#{args.map(&:inspect).join(', ')})"
      original_send = Object.instance_method(:send)
      bound_send = original_send.bind(self)
      bound_send.call(name, *args, &block)
    end
  end
  ```

  [example](016_super_in_modules_send.rb)

##supplementary knowledge:

* bind(obj) -> method   

  more info:(dash method.bind)

  Bind umeth to obj. If Klass was the class from which umeth was obtained, obj.kind_of?(Klass) must be true.

  ```ruby
class A
  def test
    puts "In test, class = #{self.class}"
  end
end
class B < A
end
class C < B
end

um = B.instance_method(:test)
bm = um.bind(C.new)
bm.call
bm = um.bind(B.new)
bm.call
bm = um.bind(A.new)
bm.call

#=>In test, class = C
#In test, class = B
#prog.rb:16:in `bind': bind argument must be an instance of B (TypeError)
# from prog.rb:16
  ```
