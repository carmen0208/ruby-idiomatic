def names
  yield "carmen1"
  yield "carmen2"
  yield "carmen3"
  yield "carmen4"
end

class MyEnumerator
  # be a child of Enumerable
  include Enumerable
  # include same error happen
  class StopIteration < RuntimeError
  end
  def initialize(object, method_name, *args)
   @fiber = Fiber.new do 
    object.send(method_name, *args) do |*yielded_val|
      Fiber.yield(*yielded_val)
    end
    raise StopIteration
   end
  end

  def next
    @fiber.resume
  end

  def each
    loop do 
      yield self.next
    end
  rescue StopIteration
  end
end

enum = MyEnumerator.new(self, :names) # => #<MyEnumerator:0x007fe6518b2970 @fiber=#<Fiber:0x007fe6518b2920>>
enum.next # => "carmen1"
enum.next # => "carmen2"
enum.next # => "carmen3"
enum.next # => "carmen4"
enum = MyEnumerator.new(self, :names)
enum.to_a                 # => 
enum = MyEnumerator.new(self, :names)
enum.detect{|n| n =~ /^S/} # => 
enum = MyEnumerator.new(self, :names)
# ~> -:19:in `block in initialize': MyEnumerator::StopIteration (MyEnumerator::StopIteration)
