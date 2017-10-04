"one".upcase

["one", "two"].map(&:upcase)

class Symbol
  def to_proc # !> method redefined; discarding old to_proc
    Proc.new {|x| x.call(self) }
  end
end

class Foo
  def something
    "what ever"
  end
  def to_proc
    Proc.new {"This is Foo#to_proc"}
  end
end

def bar(&block)
  block.call
end

bar(&Foo.new) # => "This is Foo#to_proc"
bar(&(Foo.new.something)) # => 

# ~> -:25:in `<main>': wrong argument type String (expected Proc) (TypeError)
