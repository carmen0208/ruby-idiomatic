## Nest module can include the parent Module in ruby

example

```ruby
module Parent
  def useful_function
  end

  module Child1
  #if they want to use useful_function that Parent provided, just include the
  #Parent module
    include Parent
    #...
  end

  module Child2
    include Parent
    #....
  end
end
```
