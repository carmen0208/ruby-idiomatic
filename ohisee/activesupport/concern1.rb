require 'active_support'

module ConcernModule
  extend ActiveSupport::Concern

  def instance_method
    "I am a instance method"
  end

  module ClassMethods
    def class_method
      "I am class method"
    end
  end
end

class IncludeClass
  include ConcernModule
end

p IncludeClass.class_method
p IncludeClass.new.instance_method
