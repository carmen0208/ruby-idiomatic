## 1. Fetch beyond Hash & 2. Default for nested hashed

that's things that it have been talked about in previous episode 

* [example](015_advanced_fetch.rb)

## 3. Generalized default blocks

* [example](015_advanced_fetch_block.rb)
* [example](015_advanced_fetch_block_change1.rb)

##4. Two-argument form of #fetch

**question?**: Since you can pass a second argument as a value in fetch method, 
instead of passing a block to #fetch, why not using two argument form?

```ruby
{}.fetch(:threads, 4) #=> 4
```

* here's why....

```ruby

def default
  42 # the ultimate answer
###may do something complicate calculation .....
end
 
answers = {}
# it would fetch the default method and excuted it as a return value and put it to the param.
answers.fetch("How many roads must a man walk down?", default)
# => 42

answers.fetch("How many roads must a man walk down?", method(:default))
#=> <Method: Object#default>

```

[example](015_advanced_fetch_2arguments.rb)

**conclusion:**

When the default is passed as an argument to #fetch, it is always evaluated
whether it is needed or not. Now our expensive #default code is being executed
every time we #fetch a value, even if the value is present. By our premature
optimization, we’ve now introduced a potentially much bigger performance
regresssion everywhere our #default method is used as an argument. 

If we had used the block form, the expensive computation would only have been triggered
when it was actually needed.
