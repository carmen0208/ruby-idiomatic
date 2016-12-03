module Memoizable
  def memoize(method_name)
    original_method = instance_method(method_name)  # => #<UnboundMethod: Dictionary#anagrams_for>

    define_method(method_name) do |*args, &block|
       puts "do something in proxy with unbound method"
       original_method.bind(self).call(*args, &block)
    end
  end
end
class Dictionary
  extend Memoizable

  def initialize
  end
  def anagrams_for
    puts "real thing!"
  end

  memoize :anagrams_for
end



Dictionary.new.anagrams_for

