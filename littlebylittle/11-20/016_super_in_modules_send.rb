module Logged
  def logged_send(name, *args, &block)
    puts "Sending #{name} (#{args.map(&:inspect).join(', ')})"
    #send(name, *args, &block)
    original_send = Object.instance_method(:send)
    bound_send = original_send.bind(self)
    bound_send.call(name, *args, &block)
  end
end

module PigeonPost
  def send(*message)
    #...
    puts "You message is winging its way to its recipient!"
  end
end
class Greeter
  include PigeonPost
  include Logged

  def hello(subject)
    puts "Hello, #{subject}"
  end
end

Greeter.new.logged_send(:hello, "Major Tom")


