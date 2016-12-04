module ProxyModule
  def proxy(method_name)
    original_method = instance_method(method_name)  # => #<UnboundMethod: Dictionary#anagrams_for>

    define_method(method_name) do |*args, &block|
       puts "do something in proxy with unbound method"
       original_method.bind(self).call(*args, &block)
    end
  end
end
class RealClass
  extend ProxyModule

  def initialize
  end
  def target_method
    puts "real thing!"
  end

  proxy :target_method
end



RealClass.new.target_method
