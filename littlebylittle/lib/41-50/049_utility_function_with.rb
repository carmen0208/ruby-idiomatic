module ROFLWeb

  module ModelUtils
     def self.unique_id(object)
     # puts object.respond_to?(:to_unique_id)
      if object.respond_to?(:to_unique_id)
        object.to_unique_id
      else
        p "#{object.class.name}+#{object.hash.to_s(16)}"
      end
    end

    private

     def unique_id(object)
      ModelUtils.unique_id(object)
     end
    
  end

  module UrlHelper
    include ModelUtils
    def url_for(object)
      "http://example.com/#{unique_id(object)}"
    end
 end
end

module ROFLWeb
  class MemoryRepository
    def initialize
      @repo = {}
    end
    
    def store(object)
      @repo[unique_id(object)] = object
    end

    def fetch(key, &block)
      @repo.fetch(key, &block)
    end
  end
end

include ROFLWeb::UrlHelper

repo = ROFLWeb::MemoryRepository.new
repo.store("Hello World")
puts repo.fetch(unique_id("Hello World"))


## client Class use class method instead of include all of them
class ClientCode
  
  def log_access(object)
    puts "#{ROFLWeb::ModelUtil.unique_id(object)} accessed at #{Time.now}"
  end
end
