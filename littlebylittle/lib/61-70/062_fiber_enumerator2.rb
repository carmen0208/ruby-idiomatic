#this is a complicat version because it include a with_index, it's hard to read
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
  DEFAULT_YIELD_HANDLER = ->(*yielded_values) do
    Fiber.yield(*yielded_values)
  end
  def initialize(object, method_name, *args, &yield_handler)
    method = object.method(method_name)
    yield_handler ||= DEFAULT_YIELD_HANDLER
    @fiber = Fiber.new do 
      method.call(*args, &yield_handler)
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

  def with_index
    index = 0
    self.class.new(self, :each) do |*yielded_values|
      Fiber.yield(*yielded_Values, index)
      index +=1
    end
  end
end

enum = MyEnumerator.new(self, :names) # => #<MyEnumerator:0x007f8a1293dbb0 @fiber=#<Fiber:0x007f8a1293db38>>
enum.next # => "carmen1"
enum.next # => "carmen2"
enum.next # => "carmen3"
enum.next # => "carmen4"
enum = MyEnumerator.new(self, :names)
enum.to_a                 # => ["carmen1", "carmen2", "carmen3", "carmen4"]
enum = MyEnumerator.new(self, :names)
enum.detect{|n| n =~ /^c/} # => "carmen1"
enum = MyEnumerator.new(self, :names)
