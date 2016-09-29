class CustomList <Array
  def to_s
    join(" | ")
  end

  def +(other)
    mid = super(other)
    self.class.new(mid)
  end
end

# cLists = CustomList.new
# cLists << "test with" << "a" << "list"
#
# p cLists.to_s


cl1 = CustomList.new(%w[macbook ipad])
cl2 = CustomList.new(%w[iphone macbookpro])

p cl1
p cl1.to_s
p cl2.to_s
cl3 =  cl1+cl2
p cl3.to_s
p cl3.class

class TAGList
  def initialize(*args)
    @list = Array.new(*args)
  end

  def <<(tag)
    tag.to_s.strip.split.each do |t|
      list << t
    end
    self
  end

  def to_s
    list.join(" | ")
  end

  def +(other)
    self.class.new(list + other.list)
  end

  protected

  attr_reader :list
end

tl1 = TAGList.new(%w[macbook pad])
tl2 = TAGList.new(%w[iphone macbookpro])
tl3 = tl1 + tl2
p tl3.to_s