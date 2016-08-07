#using around alias to mess up operation
class Fixnum
  alias_method :old_plus, :+

  def +(value)
    self.old_plus(value).old_plus(1)
  end
end

require_relative '../test/assertions'
assert_equals 3, 1 + 1
assert_equals 1, -1 + 1
assert_equals 111, 100 + 10
