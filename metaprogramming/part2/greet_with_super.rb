module Greetings
  def greet
    "hello"
  end
end

class MyClass
  include Greetings
end

p MyClass.new.greet

module EnthusiasticGreetings
  include Greetings
  def greet
    "Hey, #{super}!"
  end
end

class MyClass
  include EnthusiasticGreetings
end

p MyClass.ancestors[0..2]  # => [MyClass, EnthusiasticGreetings, Greetings]
p MyClass.new.greet        # => "Hey, hello!"


require_relative '../test/assertions'
assert_equals "Hey, hello!", MyClass.new.greet
assert_equals [MyClass, EnthusiasticGreetings, Greetings], MyClass.ancestors[0..2]


#now: ActiveRecord using inherient rather than alias_method_chain

#gems/activerecord-4.1.0/lib/active_record/validations.rb
# module ClassMethods
#   # Creates an object just like Base.create but calls <tt>save!</tt> instead of +save+
#   # so an exception is raised if the record is invalid.
#   def create!(attributes = nil, &block)
#     if attributes.is_a?(Array)
#       attributes.collect { |attr| create!(attr, &block) }
#     else
#       object = new(attributes)
#       yield(object) if block_given?
#       object.save!
#       object
#     end
#   end
# end
#
# # The validation process on save can be skipped by passing
# # <tt>validate: false</tt>.
# # The regular Base#save method is replaced with this when the
# # validations module is mixed in, which it is by default.
# def save(options={})
#   perform_validations(options) ? super : false
# end
#
# # Attempts to save the record just like Base#save but will raise
# # a +RecordInvalid+ exception instead of returning +false+ if
# # the record is not valid.
# def save!(options={})
#   perform_validations(options) ? super : raise(RecordInvalid.new(self))
# end
