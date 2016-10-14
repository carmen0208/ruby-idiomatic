### Basics(Ways to write class)

* [Example](033_classes_constants.rb)

### if we want one of these classes to be available outside the current scope, we should assign it to a constant instead of a local variable

```ruby
#instead
point = Class.new do
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end
#should be
Point = Class.new do
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end
```

### Explaination

 in Ruby, a class is just an object. And that when we name a class, we’re simply assigning that class to a constant

```ruby
UltimateAnswer = 42
Point = Class.new
 
```

* If we assign the class object to another constant, it retains its original name
```ruby
point = Class.new
point.name                      # => nil
point                           # => #<Class:0x98ad7d0>
Point = point
Point.name                      # => "Point"
Point                           # => Point
point.name                      # => "Point"
point                           # => Point
Point = nil
point.name                      # => "Point"
```

#### English

* novice Ruby programmers /'nɑvɪs/ n. 初学者，新手
