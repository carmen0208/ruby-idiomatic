class MyClass
  def greet
    "hello"
  end
end

module EnthusiasticGreetings
  def greet
    "Hey, #{super}!"
  end
end

class MyClass
  include EnthusiasticGreetings
end

p MyClass.ancestors[0..2]  # => [MyClass, EnthusiasticGreetings, Object]
p MyClass.new.greet        # => "hello"

require_relative '../test/assertions'
assert_equals [MyClass, EnthusiasticGreetings, Object], MyClass.ancestors[0..2]
assert_equals "hello", MyClass.new.greet
