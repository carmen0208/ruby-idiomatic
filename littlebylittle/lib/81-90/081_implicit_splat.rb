a = [:first, :second, :third, :fourth]
x, y, z = *a
x # => :first
y # => :second
z # => :third
# is it equal, a need not to be explicit splat
x, y, z = a
x # => :first
y # => :second
z # => :third

# but if it comes along with other argument, it assigned as a whole rather than
# broken down into its component elements
x, y, z = :before, a
x # => :before
y # => [:first, :second, :third, :fourth]
z # => nil
# it should explicitly splat:
x, y, z = :before, *a
x # => :before
y # => :first
z # => :second
# an other situation that implicit splat not works:

require 'set'
a = [:first, :second, :third, :fourth]
s = Set.new(a)

#If we write code with explicit splats on the right side of an assignment, 
#it will work so long as the input object is convertible to an Array. 
#Whereas if we rely on implicit splatting, the input must be an actual Array or 
#something very close to one.
s.to_a # => [:first, :second, :third, :fourth]
x,y,z = s
x # => #<Set: {:first, :second, :third, :fourth}>
y # => nil
z # => nil
x, y, z = *s
x # => :first
y # => :second
z # => :third


# implicit splating can also occur on the left side of an assignment
x = :first, :second, :third # => [:first, :second, :third]
