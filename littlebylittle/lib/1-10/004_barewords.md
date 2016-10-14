###Orgnial:
```ruby
salutation  = "Most agreeable to see you"
title       = "Commander"
full_name   = "Sam Vimes"
progname    = "Dis-organizer"
version     = "Mark 7"
designation = "Seeree"
service_inquiry = "order you a coffee"
 
puts "#{salutation}, #{title} #{full_name}. ",
     "Welcome to #{progname} version #{version}. ",
     "My name is #{designation}.",
     "May I #{service_inquiry}?"
# >> Most agreeable to see you, Commander Sam Vimes. 
# >> Welcome to Dis-organizer version Mark 7. 
# >> My name is Seeree.
# >> May I order you a coffee?
```
###Change version 1:

```ruby
$progname = "Dis-organizer"
 
module DisOrganizer
  VERSION = "Mark 7"
end
 
class CoffeeEnabled
  def service_inquiry 
    "order you a coffee"
  end
end
 
class ObsequiousImp
  SALUTATION = "Most agreeable to see you"
 
  attr_accessor :special_feature
 
  def initialize(designation)
    @designation = designation
  end
 
  def greet(title, first_name, last_name)
    puts "#{SALUTATION}, #{title} #{first_name} #{last_name}. ",
      "Welcome to #{$progname} version #{DisOrganizer::VERSION}. ",
      "My name is #{@designation}.",
      "May I #{special_feature.service_inquiry}?"
  end
end
 
imp = ObsequiousImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet "Commander", "Sam", "Vimes"
# >> Most agreeable to see you, Commander Sam Vimes. 
# >> Welcome to Dis-organizer version Mark 7. 
# >> My name is Seeree.
# >> May I order you a coffee?
```

###Changed Version 2

```ruby
#$progname = "Dis-organizer"
def progname; "Dis-organizer"; end

module DisOrganizer
#  VERSION = "Mark 7"
  def version; "Mark 7"; end
end
class CoffeeEnabled
  def service_inquiry
    "order you a coffee"
  end
end
class OrgnizedImp
  include DisOrganizer
  attr_reader :designation
  attr_accessor :special_feature
  
  def initialize(designation)
    @designation = designation
  end
 
  def salutation
    "Most agreeable to see you"
  end 

  def service_inquiry
    special_feature.service_inquiry
  end

  def greet(title, first_name, last_name)
    full_name = "#{first_name} #{last_name}"
     puts "#{salutation}, #{title} #{full_name}. ",
       "Welcome to #{progname} version #{version}. ",
       "My name is #{designation}.",
       "May I #{service_inquiry}?"
  end
end

imp = OrgnizedImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet "Ninja", "Carmen", "Liu"
# >> Most agreeable to see you, Commander Sam Vimes. 
# >> Welcome to Dis-organizer version Mark 7. 
# >> My name is Seeree.
# >> May I order you a coffee?
```

###Comparation

  Version2 never once touched the core greeting code.We changed the sources of the values it used, but we never modified it.

  And this is good, because the greeting code shouldn’t care about where the values it interpolates in come from. The only thing that code should be concerned with is how it ties those values together into a human-readable string.

  In the Perl programming language, a token in the code which has no quotes around it, no special sigil in front of it, no method-calling syntax preceding it, and no parentheses after it is referred to as a “bareword”. 

  If you have code that references named values, a bareword is the most flexible way to refer to those values. A bareword in Ruby might refer to a local variable, a method parameter, or a parameter-less method, either public or private. The code containing the bareword doesn’t need to be concerned with which of those contexts the value is defined in. In fact, over the life of the program a bareword might start out referring to a local variable and wind up referring to a method, and the transition is transparent from the point of view of any code referring to it.
