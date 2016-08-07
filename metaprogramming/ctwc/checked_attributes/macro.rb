require 'minitest/autorun'

class Class
  def attr_check(attribute, &validation)
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end
class Person
  attr_check :age do |v|
    v >= 18
  end
end

class TestCheckedAttribute < Minitest::Test
  def setup
    # add_check_attribute(Person, :age) {|v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_valid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end

end

# def add_check_attribute(klass, attribute, &validation)
#   klass.class_eval do
#     define_method "#{attribute}=" do |value|
#       raise 'Invalid attribute' unless validation.call(value)
#       instance_variable_set("@#{attribute}", value)
#     end
#
#     define_method attribute do
#       instance_variable_get "@#{attribute}"
#     end
#   end
# end
