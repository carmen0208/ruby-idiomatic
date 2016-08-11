class MyClass
  def greet
    "hello"
  end
end

MyClass.new.greet

module EnthusiasticGreetings
  def greet
    "Hey, #{super}!"
  end
end

class MyClass
  prepend EnthusiasticGreetings
end

p MyClass.ancestors[0..2]
p MyClass.new.greet


require_relative '../test/assertions'
assert_equals [EnthusiasticGreetings, MyClass, Object], MyClass.ancestors[0..2]
assert_equals "Hey, hello!", MyClass.new.greet
