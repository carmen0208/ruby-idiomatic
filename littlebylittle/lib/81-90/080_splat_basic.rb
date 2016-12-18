a1 = [:first, :second,:third, :fourth]
a2 = [:before, a1, :after] # => [:before, [:first, :second, :third, :fourth], :after]
a2.flatten! # => [:before, :first, :second, :third, :fourth, :after]
# splate:
a2 = [:before,*a1, :after] # => [:before, :first, :second, :third, :fourth, :after]
#This behavior, sometimes called “destructuring”, is the essence of splatting.
x,y,z = 1, 2, 3
x # => 1
y # => 2
z # => 3
x, y, z = *a1
x # => :first
y # => :second
z # => :third
x, y, z = :before, *a1
x # => :before
y # => :first
z # => :second
#They can also be used on the left side, to “slurp up” multiple values from the right side into a single variable.
a1 = [:first, :second, :third, :fourth]
*x, y, z = *a1
x # => [:first, :second]
y # => :third
z # => :fourth
x, *y, z = *a1
x # => :first
y # => [:second, :third]
z # => :fourth
x, y, *z = *a1
x # => :first
y # => :second
z # => [:third, :fourth]
#a common need when programming in a functional, recursive style
a1 = [:first, :second, :third, :fourth]
first, *rest = *a1
first # => :first
rest # => [:second, :third, :fourth]

def sum3(x,y,z)
  x + y + z
end

triangle = [90,30,60]
sum3(*triangle) # => 180

def greet(greeting, *names)
  names.each do |name|
    puts "#{greeting}, #{name}"
  end
end

greet("Good Morning", "carmen", "ninja", "someone")

def random_draws(num_times,num_draws) 
  num_times.times do 
    *draws = num_draws.times.map {rand(10)} # => [6, 1, 9], [5, 7, 1], [4, 0, 5], [2, 0, 9], [8, 6, 6], [2, 0, 8], [3, 4, 2], [2, 0, 4], [0, 6, 9], [2, 5, 1]
    yield(*draws)
  end
end

random_draws(5,3) do |first, second, third| # !> shadowing outer local variable - first
  puts "#{first} #{second} #{third}"
end
#
random_draws(5,3) do |first, *rest| # !> shadowing outer local variable - rest
  puts "#{first} #{rest}"
end
# >> Good Morning, carmen
# >> Good Morning, ninja
# >> Good Morning, someone
# >> 6 1 9
# >> 5 7 1
# >> 4 0 5
# >> 2 0 9
# >> 8 6 6
# >> 2 [0, 8] [0, 8]
# >> 3 [4, 2] [4, 2]
# >> 2 [0, 4] [0, 4]
# >> 0 [6, 9] [6, 9]
# >> 2 [5, 1] [5, 1]
