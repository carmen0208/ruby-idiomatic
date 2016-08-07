require 'minitest/autorun'

class Person
end

class TestCheckedAttribute < Minitest::Test
  def setup
    add_check_attribute(Person, :age)
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_nil_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = nil
    end
  end
  def test_refuses_false_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = false
    end
  end
end

#Step 1
# def add_check_attribute(klass, attribute)
#   klass.class_eval do
# #...
#   end
# end
#Step 2
# def add_check_attribute(klass, attribute)
#   klass.class_eval do
#     define_method "#{attribute}=" do |value|
#       # ...
#     end
#
#     define_method attribute do
#       # ...
#     end
#   end
# end

#Step 3
def add_check_attribute(klass, attribute)
  klass.class_eval do
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless value
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end
# Here is the method that you should implement.
# def add_check_attribute(klass, attribute)
#   eval "
#     class #{klass}
#       def #{attribute}=(value)
#         raise 'Invalid attribute' unless value
#         @#{attribute} = value
#       end
#       def #{attribute}()
#         @#{attribute}
#       end
#     end
#   "
# end
