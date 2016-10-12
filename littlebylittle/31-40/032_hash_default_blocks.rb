word_count = {}

text = <<END
I'm your only friend
I'm not your only friend
But I'm a little glowing friend
But really I'm not actually your friend
But I am
END

text.split.map(&:downcase).each do |word|
  word_count[word] ||= 0
  word_count[word] += 1
end
puts text.split
puts word_count

#=> {"i'm"=>4, "your"=>3, "only"=>2, "friend"=>4, "not"=>2, "but"=>3, "a"=>1, "little"=>1, "glowing"=>1, "really"=>1, "actually"=>1, "i"=>1, "am"=>1}

