class C
  # it is the preferrable usage
  #  It may be repetitive, but it’s individually meaningful for each method
  def self.foo
    puts "Who needs instance, I'm a class method"
  end

  # drawbacks: when Class name changes it would be a trouble
  def C.bar
    puts "I'm a call method too!"
  end
  puts "Hello, from #{self}"

  # The downside is that if the class has more than a few short class methods, 
  # it can be easy to lose track of whether you’re looking at a class method 
  # or an instance method since there’s nothing to visually flag the individual
  # methods as class-level.
  class << self
    def baz
      puts "Just another class method"
    end
  end
end

s = "Bob"
def s.greet
  puts "Hi, I'm #{self}"
end

C.foo
C.bar
C.baz
s.greet


# >> Hello, from C
# >> Who needs instance, I'm a class method
# >> I'm a call method too!
# >> Just another class method
# >> Hi, I'm Bob
