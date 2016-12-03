module Memoizable
  def memoize(method_name)
    # get a unboundMethod throught method name, unboundmethod can be bound, but
    # when it's bound, it could be a orignal one even if the method have been
    # changed!
    orignal_method = instance_method(method_name)  # => #<UnboundMethod: Dictionary#anagrams_for>
    ## define a name that cache all the things
    cache_ivar = "@memoized_#{method_name}"

    ## Using define_method to modiify the orignal method 

    define_method(method_name) do |*args, &block|
      cache = if instance_variable_defind?(cache_ivar)
                instance_variable_get(cache_ivar)
              else
                instance_variable_set(cache_ivar, {})
              end
      if cache.key?(args)
        return cache[args]
      else
        result = original_method.bind(self).call(*args, &block)
        cache[args] = result
        result
      end
    end
  end

end
class Dictionary
  extends Memoizable

  def initialize(dict_path)
   @dict_path = dict_path
  end

  def anagrams_for(word)
    word.downcase.chars.to_a.permutation.select do |perm|
      perm_word = perm.join
      IO.foreach(@dict_path).any? {|dict_word|
        dict_word.downcase.chomp == perm_word.downcase
      }
    end.map(&:join).uniq
  end

  memoize: anagrams_for
end

dict = Dictory.new("/user/share/dict/words")

require 'benchmark'

Benchmark.bm { |bm|
  bm.report("1st call: ") {dict.anagrams_for("carmen")}  #=> ["carmen","nemrac"]
  bm.report("2rd call: ") {dict.anagrams_for("carmen")} #=> ["carmen","nemrac"]
}
# >>  user        system       total          real
# >> 1st call:   1.800000   0.030000    1.830000  (   1.976996)
# >> 2rd call:   0.000000   0.000000    0.000000  (   0.000006)
