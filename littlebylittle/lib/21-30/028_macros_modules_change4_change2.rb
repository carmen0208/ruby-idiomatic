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
      # Says whether mod or its ancestors have a constant with the given name:
      mod = if const_defined?(:Events, false)
              const_get(:Events)
            else
                new_mod = Module.new do 
                  def self.to_s
                    "Events(#{instance_methods(false).join(', ')})"
                  end
                end
                #Sets the named constant to the given object, returning that object. Creates a new constant if no constant with the given name previously existed.
                const_set(:Events, new_mod)
            end
      #inserting the generated method into the class’s ancestor chain
      mod.module_eval(%Q{
        def #{name}(*args)
          notify_listeners(:#{name}, *args)
        end
      })
      include mod
    end

  end
end
class Dradis
  include Eventful

  event :new_contact
  event :radiation_warning
  event :tigh_is_drink_again

  attr_reader :contact_count

  def initialize
    @contact_count = 0
  end

  #not works because it creating an infinite recursion and overflowing the stack
  def new_contact(*args)
    @contact_count +=1
    super
    # new_contact(*args)
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
puts Dradis.ancestors

 #=>Dradis
 #=>Events(new_contact, radiation_warning, tigh_is_drink_again)
 #=>Eventful
 #=>Object
 #=>Kernel
 #=>BasicObject

Dradis::Events.instance_methods(false).each do |event_trigger|
  puts event_trigger
end

 #=>new_contact
 #=>radiation_warning
 #=>tigh_is_drink_again
