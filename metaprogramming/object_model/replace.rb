def replace(array, orignal, replacement)
  array.map {|e| e==orignal ? replacement : e}
end

require "minitest/autorun"

class ReplacementTest < Minitest::Test
  def test_replace
    original = ['one', 'two', 'one', 'three']
    replaced = replace(original, 'one', 'zero')
    assert_equal ['zero', 'two', 'zero', 'three'], replaced
  end
end

# replace method has an defination in Array, it can be a risk
class Array
  def replace(orignal, replacement)
    self.map { |e| e == orignal ? replacement : e}
  end
end

class ArrayExtensionTest < Minitest::Test
  def test_replace
    original = ['one', 'two', 'one', 'three']
    replaced = original.replace('one', 'zero')
    assert_equal ['zero', 'two', 'zero', 'three'], replaced
  end
end

# it can be dangerous because you might trace other array replace method,
# which would crash he other function
# Monkey patching
puts [].methods.grep /^re/
