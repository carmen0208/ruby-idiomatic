class C; end

# First, the class << foo syntax opens up foo's singleton class (eigenclass).
# This allows you to specialise the behaviour of methods called on that specific object.
class << C
  def my_marco(arg)
    p "my_marco(#{arg}) called"
  end
end

class C
  my_marco :x # => "my_macro(x) called"
end