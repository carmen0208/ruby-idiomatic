@names = %w[Ylva Brighid Shifra Yesamin]

# This method yield @names 4 times. and each time, pick up one of the character
# out
def names
  yield @names.shift
  yield @names.shift
  yield @names.shift
  yield @names.shift
end

#names do |name| 
#  puts name
#end # => 

# this is a method from object.rb
enum = to_enum(:names) # => #<Enumerator: main:names>
enum.next # => "Ylva"
@names # => ["Brighid", "Shifra", "Yesamin"]
enum.next # => "Brighid"
@names # => ["Shifra", "Yesamin"]
enum.next # => "Shifra"
enum.next # => "Yesamin"
enum.next rescue $!# => 
@names = %w[Kashti Aodhan Edgar Heinlein Carmen hello kitty]
enum.rewind # => #<Enumerator: main:names>
enum.next # => "Kashti"

# One handy method Enumerator includes is #with_index. This method lets us iterate through the yielded values with an added index variable. This variable automatically counts up with each yield
#
enum.with_index do |name, index| 
  puts "#{index} : #{name}"
end
# >> 0 : Aodhan
# >> 1 : Edgar
# >> 2 : Heinlein
# >> 3 : Carmen
#
#
# Enumerator:
# Enumerator takes a method that yields multiple times, and effectively turns it inside out: instead of the method driving execution by yielding repeatedly to a block, we can drive the method’s execution forward as needed by calling #next on the Enumerator.


