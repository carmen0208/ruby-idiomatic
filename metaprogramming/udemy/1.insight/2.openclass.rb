class String 
  def foo
    "bar"
  end
end

"carmen".foo # => "bar"

class Array
  def concat # !> method redefined; discarding old concat
    raise "Can't reverse arrays!"
  end
end

 
#["1","2"].concat # => 

#
# Dack Typeed

def reverse_day(array)
  array.reverse
end

reverse_day([1,2,3]) # => [3, 2, 1]
reverse_day("hello") # => "olleh"
#reverse_day(12345) # => 

# Just a rubbale code
self.class # => Object
