module Greetings
  def greet
    "hello"
  end
end

class MyClass
  include Greetings
end

MyClass.new.greet

class MyClass
  include Greetings
  def greet_with_enthusiasm
    "Hey, #{greet_without_enthusiasm}!"
  end
  
  alias_method :greet_without_enthusiasm, :greet
  alias_method :greet, :greet_with_enthusiasm
end

p MyClass.new.greet

p MyClass.new.greet_without_enthusiasm

require_relative  '../test/assertions'

assert_equals "hello", MyClass.new.greet_without_enthusiasm
assert_equals "Hey, hello!", MyClass.new.greet_with_enthusiasm
assert_equals "Hey, hello!", MyClass.new.greet



#validations.rb in active_record
# def self.included(base)
#   base.extend ClassMethods
#   # ...
#   base.class_eval do
#     alias_method_chain :save, :validation
#     alias_method_chain :save!, :validation
#   end
# 
#   # ...
# 
#   base.send :include, ActiveSupport::Callbacks
#   base.define_callbacks *VALIDATIONS
# end
#  
# def save_with_validation(perform_validation = true)
#   if perform_validation && valid? || !perform_validation
#     save_without_validation
#   else
#     false
#   end
# end
# # Attempts to save the record just like Base#save but will raise a RecordInvalid exception instead of returning false
# # if the record is not valid.
# def save_with_validation!
#   if valid?
#     save_without_validation!
#   else
#     raise RecordInvalid.new(self)
#   end
# end

#activesupport --> aliasing.rb
# def alias_method_chain(target, feature)
# Strip out punctuation on predicates, bang or writer methods since
# e.g. target?_without_feature is not a valid method name.
# aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
# yield(aliased_target, punctuation) if block_given?
# 
# with_method = "#{aliased_target}_with_#{feature}#{punctuation}"
# without_method = "#{aliased_target}_without_#{feature}#{punctuation}"
# 
# alias_method without_method, target
# alias_method target, with_method
# 
# case
#   when public_method_defined?(without_method)
#     public target
#   when protected_method_defined?(without_method)
#     protected target
#   when private_method_defined?(without_method)
#     private target
# end
# end