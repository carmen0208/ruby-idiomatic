mymethod = def hello
              put "hello, world!"
           end

p mymethod#=> :hello

#upgrade to be a first_class citizen

class Greeter
  def hello
    puts "hello, world"
  end
end
 
greeter = Greeter.new
p m = greeter.method(:hello) # => #<Method: Greeter#hello> 
p m.call #=> "hello, world"
