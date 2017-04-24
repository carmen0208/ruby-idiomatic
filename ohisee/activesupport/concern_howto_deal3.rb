require 'active_support'
require_relative 'concern1'


module ConcernB
  extend ActiveSupport::Concern

  module ClassMethods
    def b_concern_method
      "B concern method"
    end
  end
  def self.instance_check
    instance_variable_get(:@_dependencies)
  end
  include ConcernModule
end

p ConcernB.instance_check
#p ConcernB.class_method

class MyClass
  include ConcernB
end

p MyClass.class_method

#souce code from ActiveSupport
#
#  module Concern
#   class MultipleIncludedBlocks < StandardError #:nodoc:
#     def initialize
#       super "Cannot define multiple 'included' blocks for a Concern"
#     end
#   end
#
#   def self.extended(base) #:nodoc:
#     base.instance_variable_set(:@_dependencies, [])
#   end
#
#   def append_features(base)
#     if base.instance_variable_defined?(:@_dependencies)
#       base.instance_variable_get(:@_dependencies) << self
#       return false
#     else
#       return false if base < self
#       @_dependencies.each { |dep| base.send(:include, dep) }
#       super
#       base.extend const_get(:ClassMethods) if const_defined?(:ClassMethods)
#       base.class_eval(&@_included_block) if instance_variable_defined?(:@_included_block)
#     end
#   end
