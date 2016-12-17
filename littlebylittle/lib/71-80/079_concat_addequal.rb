shopping_list = ["bread","milk","granola"]
#shopping_list += "cheese" # => 

shopping_list += ["swiss","brie","cheddar"] # => 

 #class Shopper
 #  def initialize(list)
 #    @list = list
 #  end

 #  attr_reader :list
 #end


#s = Shopper.new(["bread","milk","granola"])
#p s.list += ["swiss","brie","cheddar"] # => 
# => 
class Shopper
  def initialize(list)
    @list = list
  end
 
  attr_accessor :list
end
hared_list = ["bread", "milk", "granola"]
stacey = Shopper.new(shared_list)
avdi   = Shopper.new(shared_list)
stacey.list += ["swiss", "brie", "cheddar"]
stacey.list                     # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
avdi.list                       # => ["bread", "milk", "granola"]
stacey.list.object_id           # => 4977680
avdi.list.object_id             # => 4977820

## += is an new list, it is not the orignal list plus one data
#stacey.list = stacey.list + ["swiss", "brie", "cheddar"]
#is a new list now
