require 'minitest/autorun'
require_relative 'using'

class TestUsing < Minitest::Test
  def test_dispose_of_resources
    r = Resource.new
    using(r) {}
    assert r.disposed?
  end

  def test_disoses_of_reources_in_case_of_exception
    r = Resource.new
    assert_raises(Exception) {
      using(r){
        raise Exception
      }
    }
    assert r.disposed?
  end
end
