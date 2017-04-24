class Parent
  def hello(subject ="World")
    puts "Hello, #{subject}"
    if block_given?
      yield
      puts "Well, nice seeing you !"
    end
  end
end

class Child < Parent
  def hello(subject=:default)
    #1. super(subject)
    #2. super
    if subject == :default
      # puts true
      super()
    else
      super(subject)
    end
    puts "How are you today?"
  end
end
Child.new.hello("Bob")
puts "here's the problem: if we passing :default, it would output default instead of super"
Child.new.hello(:defalut)
puts "here's the thing that we want to be output"
Child.new.hello
puts "with block"
Child.new.hello(:defalut) do
  puts "Hi there, Child!"
end
