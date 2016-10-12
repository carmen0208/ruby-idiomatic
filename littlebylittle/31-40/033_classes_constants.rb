point = Class.new do
  attr_reader :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end
end

point.class # => Class

puts p1 = point.new(5,7)
# => #<#<Class:0x9fc06f8>:0x9ff789c @x=5, @y=7>

circle = Class.new(point) do
  attr_reader :redius
  def initialize(x,y,radius)
    super(x,y)
    @radius = radius
  end
end

puts c1 = circle.new(3,5,10)
# => #<#<Class:0x974c620>:0x974c5a8 @x=3, @y=5, @radius=10>
#
