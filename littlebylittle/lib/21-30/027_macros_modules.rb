module Eventful
  def self.included(other)
    other.extend(Macros)
  end

  def add_listener(listener)
    (@listeners ||= []) << listener
  end

  def notify_listeners(event, *args)
    (@listeners ||[]).each do |listener|
      listener.public_send("on_#{event}", *args)
    end
  end
  module Macros
    def event(name)
      module_eval(%Q{
        def #{name}(*args)
          notify_listeners(:#{name}, *args)
        end
      })
    end

  end
end
module ABC
end
class Dradis
  include Eventful
  extend ABC 
  event :new_contact
end

class ConsoleListener
  def on_new_contact(direction, range)
    puts "DRADIS contact! #{range} kilometers, bearing #{direction}"
  end
end
 
dradis = Dradis.new
dradis.add_listener(ConsoleListener.new)
dradis.new_contact(120, 23000)

puts Dradis.ancestors
#puts dradis.ancestors
