$progname = "Dis-organizer"

module DisOrganizer
  VERSION = "Mark 7"
end
class CoffeeEnabled
  def service_inquery
    "order you a coffee"
  end
end
class OrgnizedImp
  SALUTATION  = "Most agreeable to see you"

  attr_accessor :special_feature

  def initialize(designation)
    @designation = designation
  end
  def greet(title, first_name, last_name)
 
  puts "#{SALUTATION}, #{title} #{first_name} #{last_name}. ",
     "Welcome to #{$progname} version #{DisOrganizer::VERSION}. ",
     "My name is #{@designation}.",
     "May I #{special_feature.service_inquery}?"
  end
end

imp = OrgnizedImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet "Ninja", "Carmen", "Liu"
# >> Most agreeable to see you, Commander Sam Vimes. 
# >> Welcome to Dis-organizer version Mark 7. 
# >> My name is Seeree.
# >> May I order you a coffee?
