class Point
  def self.my_new(*args,&block)
    instance = allocate
    #instance.instance_vaiable_set(:x, x)
    #instance.instance_vaiable_set(:y, y)

    instance.my_initialize(*args,&block)
    instance
  end


  def my_initialize(x,y) 
    @x = x
    @y = y
  end
end

p Point.my_new(3,5)
#=><Point:0x007fc6e506ff78 @x=3, @y=5>
#The code we’ve just written is exactly how Ruby’s own .new and #initialize work.

