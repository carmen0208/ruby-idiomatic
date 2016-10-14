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
class Dradis
  include Eventful
 
  event :new_contact

  attr_reader :contact_count

  def initialize
    @contact_count = 0
  end

  #Worked ,but it awfully verbose for such a simple change
  alias_method :new_contact_without_count, :new_contact
  def new_contact(*args)
    @contact_count += 1
    new_contact_without_count(*args)
  end
end

class ConsoleListener
  def on_new_contact(direction, range)
    puts "DRADIS contact! #{range} kilometers, bearing #{direction}"
  end
end
 
dradis = Dradis.new
dradis.add_listener(ConsoleListener.new)
dradis.new_contact(120, 23000)
