require 'active_support'

module MyConcern
  extend ActiveSupport::Concern

  def an_instance_method
    "an instance method"
  end
  module ClassMethods
    def a_class_method
      "a class method"
    end

  end
end

class MyClass
  include MyConcern
end

p MyClass.new.an_instance_method
p MyClass.a_class_method



#gems/activesupport-4.1.0/lib/active_support/concern.rb

# module Concern
#   class MultipleIncludedBlocks < StandardError #:nodoc:
#     def initialize
#       super "Cannot define multiple 'included' blocks for a Concern"
#     end
#   end
#
#   def self.extended(base)
#     base.instance_variable_set(:@_dependencies, [])
#   end
#
#   # ...
#   def append_features(base)
#     if base.instance_variable_defined?(:@_dependencies)
#       base.instance_variable_get(:@_dependencies) << self
#       return false
#     else
#       return false if base < self
#       @_dependencies.each { |dep| base.send(:include, dep) }
#       super
#       base.extend const_get(:ClassMethods) \
#           if const_defined?(:ClassMethods)
#       # ...
#       base.class_eval(&@_included_block) \
#           if instance_variable_defined?(:@_included_block)
#     end
#   end

#This is a hard piece of code to wrap your brain around,
# but its basic idea is simple: never include a concern in another concern.
# Instead, when concerns try to include each other,
# just link them in a graph of dependencies.
# When a concern is finally included by a module that is not itself a concern,
# roll all of its dependencies into the includer in one fell swoop.

#First, you must add yourself to that chain of ancestors,
# by calling the standard Module.append_features with super.
# Finally, don’t forget what this entire machinery is for:
# you have to extend the includer with your own ClassMethods module,
# like the include-and-extend trick does. You need Kernel#const_get to get
# a reference to ClassMethods, because you must read the constant from the
# scope of self, not the scope of the Concern module,
# where this code is physically located.