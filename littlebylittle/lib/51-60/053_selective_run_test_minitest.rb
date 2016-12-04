require 'minitest/autorun'

class TestArithmetic < MiniTest::Unit::TestCase
  def test_addition
    assert_equal 5, 2 + 3
  end

  def test_addition_is_commutative
    assert_equal 5, 3 + 2
  end

  def test_substraction
    assert_equal 1, 3 - 2
  end
end
