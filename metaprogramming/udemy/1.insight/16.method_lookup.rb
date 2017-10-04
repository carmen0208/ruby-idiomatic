class Parent 
  def parent
    "parent"
  end
  def hand
    "parent hand"
  end

  def leg
     "parent leg"
  end

  def method_missing(m, *args, &block)
    if m == :nothing
      "Nothing is something, 43"
    else
      super
    end
  end
end

module Hand
  def hand
    "plug hand"
  end
end

module Leg
  def leg
    "plug leg"
  end
end
class Child < Parent
  include Hand
  include Leg

  def child
    "child"
  end

end

somebody = Child.new
somebody.child # => "child"
somebody.leg # => "plug leg"
somebody.hand # => "plug hand"
somebody.parent # => "parent"
somebody.nothing # => "Nothing is something, 43"
