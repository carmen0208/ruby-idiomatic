## What's utility function

```ruby
module_function :method
```

## What's the do

```ruby
class Demo
   def self.some_method()
   end

   private
   
   def some_method
   end
end

# equals:
class Demo
   module_function

   def some_method
   end
end
```

## Example

* [example(Not using module_function)](049_utility_function_without.rb)
* [example(Using module_function)](049_utility_function_with.rb)

## Benefit

reduce the code

## Extensice Reference

* object.hash

   ```ruby
   object = Struct.new(:name,:address)
   p object.hash  #=> -2946487189218774034
   p object.hash.to_s(16)  # => "-28e4067cc89fcc12"
   p object.hash.to_s(10)  # => "-2946487189218774034"
   p object.hash.to_s(32) #=> "-2hp06fj49vj0i" 
   ```

* metaprogramming skill/methods
  * response_to?
