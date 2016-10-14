word_count = Hash.new do |hash, missing_key|
  hash[missing_key] = 0
end

text = <<END
I'm your only friend
I'm not your only friend
But I'm a little glowing friend
But really I'm not actually your friend
But I am
END

text.split.map(&:downcase).each do |word|
  word_count[word] += 1
end
puts word_count

#=> {"i'm"=>4, "your"=>3, "only"=>2, "friend"=>4, "not"=>2, "but"=>3, "a"=>1, "little"=>1, "glowing"=>1, "really"=>1, "actually"=>1, "i"=>1, "am"=>1}


h = Hash.new do |hash, missing_key|
  hash[missing_key] = 0
end

puts h.default_proc #=> #<Proc:0x007fb6c41be8d8@032_hash_default_blocks_refact1.rb:21>
puts h.default_proc.call({}, :foo) #=> 0
