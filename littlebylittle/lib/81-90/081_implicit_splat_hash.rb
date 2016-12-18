h = {:orange => :juice,
     :apple => :cider,
     :lemon => :lemonade
}

h.each do |key, value|
  puts "#{key}, #{value}"
end

h.each do |arg|
  puts "#{arg}"
end


# the most surprised thing is the explicitly apply a splat to the single argument, 
# and instead of getting the same pair of elements, you get a doubly-nested array
# it is neither consistent nor helpful to me
h.each do |*arg|
  puts "#{arg}"
end



def yield_pair
  yield([:foo, :bar])
end

yield_pair do |*pair|
  puts pair.inspect
end
yield_pair do |_,*pair|
  puts pair.inspect # !> `*' interpreted as argument prefix
end
# >> orange, juice
# >> apple, cider
# >> lemon, lemonade
# >> [:orange, :juice]
# >> [:apple, :cider]
# >> [:lemon, :lemonade]
# >> [[:orange, :juice]]
# >> [[:apple, :cider]]
# >> [[:lemon, :lemonade]]
# >> [[:foo, :bar]]
# >> [:bar]
