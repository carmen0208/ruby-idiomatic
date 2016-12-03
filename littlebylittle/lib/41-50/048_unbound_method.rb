class Human
  def name
    "God"
  end
end

p um = Human.instance_method(:name) #=> #<UnboundMethod: Human#name>
human = Human.new
method_new = um.bind(human)
p human.name
p method_new.call

class Human
  def name
    "carmen"
  end
end

human2 = Human.new
# since um is the orignal method, if method change, it's none of his business.
# they would bound the old method. that's why method_new2.call put "God"
method_new2 = um.bind(human2)

p human2.name
p method_new2.call
