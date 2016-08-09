module SecondLevelModule
  def self.included(base)
    base.extend ClassMethods
  end

  def second_level_instance_method; 'ok'; end

  module ClassMethods
    def second_level_class_method; 'ok'; end
  end
end

module FirstLevelModule
  def self.included(base)
    base.extend ClassMethods
    # this is the place where the fixed
    base.send :include, SecondLevelModule
  end

  # ...

  def first_level_instance_method; 'ok'; end

  module ClassMethods
    def first_level_class_method; 'ok'; end
  end
end

class BaseClass
  include FirstLevelModule
end

p BaseClass.new.first_level_instance_method      # => "ok"
p BaseClass.new.second_level_instance_method     # => "ok"

p BaseClass.first_level_class_method             # => "ok"

p BaseClass.second_level_class_method


require_relative '../test/assertions'
assert_equals "ok", BaseClass.new.first_level_instance_method
assert_equals "ok", BaseClass.new.second_level_instance_method
assert_equals "ok", BaseClass.first_level_class_method
assert_equals "ok", BaseClass.second_level_class_method
