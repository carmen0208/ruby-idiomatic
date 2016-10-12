point = Class.new do
  attr_reader :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end
end


 puts point = Class.new
 puts point.name                      # => nil
 puts point                           # => #<Class:0x98ad7d0>
 Point = point
 puts Point.name                      # => "Point"
 puts Point                           # => Point
 puts point.name                      # => "Point"
 puts point                           # => Point
 Location = Point
 puts Location.name
 Point = nil
 puts point.name                      # => "Point"
