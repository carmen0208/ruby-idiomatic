module CachedModel
  def self.included klass
    klass.extend CachedModuleClassMethods
    # klass.include ActiveModel::Model
  end

  def as_json
    raise NotImplementedError, "Please implement #{self.class}#as_json"
  end

  def to_json context={}
      super
  end

  def serializer_cache_key
    raise NotImplementedError, "Please implement #{self.class}#serializer_cache_key"
  end

  module CachedModuleClassMethods
    def serializer_cache_object _id
      raise NotImplementedError, "Please implement #{self}.serializer_cache_object"
    end
  end
end

class RealWorld
  include CachedModel

  def self.serializer_cache_object id
   new id: id
  end

  def initialize(id)
    @id = id
  end


  def as_json
    "ActiveModelSerializers::SerializableResource.new(self).as_json"
  end

  def serializer_cache_key
    "serializer:#{self.class.model_name.cache_key}:#{id}"
  end
end

puts RealWorld.serializer_cache_object "k"
