## Impliement a Enumerator our self

* Fiber

  what is Fiber and How to use it? 

  this is a use case for our won.

  Fiber.yield an things that they won't be fire until Fiber.resume

```ruby
@fiber = Fiber.new do
  object.send(method_name,*args) do |*yielded_val|
    Fiber.yield(*yielded_val)
  end
end

#....
def next
@fiber.resume
end
```

Here's more details example

[example](062_fiber_enumerator.rb)
