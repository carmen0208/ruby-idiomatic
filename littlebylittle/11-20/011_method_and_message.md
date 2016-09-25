####Unlike other dynamic programming languages, such as JavaScript and Python, methods are not a first-class object in Ruby

```ruby
mymethod = def hello
              put "hello, world!"
           end

mymethod#=> nil
```

###However, we can ask for an object representing a methods. 
```ruby
class Greeter
  def hello
    puts "Hello, World"
  end
end

greeter = Greeter.new
m = greeter.method(:hello) #=> #<Method: Greeter#hello> 
#We can then call this method object just as we would a proc or lambda:
m.call # >> hello, world
```

###Or, in an other words: we can upgrade method to be a first-class citizen:

```ruby
def plus1 x 
  x + 1
end
first_class_plus1 = method(:plus1)
[1,2,3,4].map &first_class_plus1
```

###Or, when we can define Proc instead of method to makes it as a first class
citizen.

```ruby
plus1 = -> (x) {x+1}
[1,2,3,4].map &plus1
```

##Why aren’t Ruby methods first-class, anyway?

The choice not to make methods first-class objects out of the box is fundamentally consistent with Ruby’s nature as a purely object-oriented language

####To understand why, we need to understand the difference between methods and messages.

dig into example difference between [Passing Method as Object](011_method_and_message_method.rb) 
and [Passing Object to calls method](011_method_and_message_message.rb). 

* For [Passing Method as Object](011_method_and_message_method.rb)

 We passed in a handle to the specific implementation of the #notify method at that point in time. And that point in time was before we initialized the plugins!

* For [Passing Object to calls method](011_method_and_message_message.rb).

 we change the SleepTimer class to call #notify on the notifier, instead of #call, 
 which means that when I write “notifier.notify” in Ruby, that means I’m sending 
 the =#notify= message to the =notifier= object.

* This code neatly demonstrates the difference between calling a method and sending a message. When our code saved a direct reference to a method and then called it later, it missed out on any changes to that method which occurred between when the reference was saved and when the method was executed. When we changed the code to send the #notify message to the notifer, it got the most up-to-date implementation of that responsibility.

* to summarize the difference:

   * A message is a name for a responsibility which an object may
have.
   * A method is a named, concrete piece of code that encodes one way

   * a responsibility may be fulfilled. You might say that it is one
method by which a message might be implemented. 

You can look at messages as an extra layer of indirection on top of methods. 
When an object receives a message, it gets to decide how to respond to that message. 
How it responds to a message may change over the course of the object’s lifetime. 
When code passes references to specific methods around, those references are in 
danger of going stale. It introduces a subtle temporal coupling between collaborating objects.

By sending messages to their collaborators, objects are assured of getting the current, 
correct behavior no matter what. The temporal coupling becomes a more benign name coupling.

Alan Kay envisioned objects as independent cells, passing messages to each other 
with no assumptions about how those messages would be handled. Ruby hews to this 
vision of object-oriented programming. So if you’ve ever wondered why we don’t pass 
references to methods around more often in Ruby, now you know.
