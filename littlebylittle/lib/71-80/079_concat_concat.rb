shopping_list = ["bread","milk","granola"]
#shopping_list += "cheese" # => 

shopping_list += ["swiss","brie","cheddar"] # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]

class Shopper
  def initialize(list)
    @list = list
  end
 
  attr_accessor :list
end
shared_list = ["bread", "milk", "granola"]
stacey = Shopper.new(shared_list)
avdi   = Shopper.new(shared_list)
stacey.list.concat(["swiss", "brie", "cheddar"])
stacey.list                     # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
avdi.list                       # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
stacey.list.object_id           # => 70169142021400
avdi.list.object_id             # => 70169142021400

## With concat, list is a same list with the same object_id
