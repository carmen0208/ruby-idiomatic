class Dictionary
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
end

dict = Dictory.new("/user/share/dict/words")

require 'benchmark'

puts Benchmark.measure {
  dict.anagrams_for("carmen") #=> ["carmen","nemrac"]
}
# >> 1.800000   0.030000    1.830000  (   1.976996)
Benchmark.bm { |bm|
  bm.report("1st call: ") {dict.anagrams_for("carmen")}  #=> ["carmen","nemrac"]
  bm.report("2rd call: ") {dict.anagrams_for("carmen")} #=> ["carmen","nemrac"]
}

