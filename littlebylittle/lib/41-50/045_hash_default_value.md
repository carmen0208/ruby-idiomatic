## Hash Default Values:

* the benefit of setting default value(in 032, it described about it)

```ruby
text = <<END
I'm your only friend
I'm not your only friend
But I'm a little glowing friend
But really I'm not actually your friend
But I am
END
# set up a default value, which means that, if there's no value for the key,
# the value would be 0
# ex: would_count["aaa"]
# #=> 0
# world_count[bbb"]
# #=> 0
word_count = Hash.new do |hash, default_value|
  hash[default_value] = 0
end

word_count["aaa"] #=> 0
word_count["bbb"] #=> 0
word_count #=>  {"asdas"=>0, "addd"=>0}

text.split.map(&:downcase).each do |word|
  word_count[word] += 1
end

word_count[word]
# => {"i'm"=>4, "your"=>3, "only"=>2, "friend"=>4, "not"=>2, "but"=>3, "a"=>1, "little"=>1, "glowing"=>1, "really"=>1, "actually"=>1, "i"=>1, "am"=>1}
```

### Now it's the interest part for default value

1. through parameters

   ```ruby
    word_count = Hash.new(0)
    value_array = Hash.new([])
   ```

2. through blocks
    
   ```ruby
    word_count = Hash.new {|hash, default_value| hash[default_value] = 0}
    value_array = Hash.new {|hash, default_value| hash[default_value] = [] }
   ```
### Here's some examples of why you need to using blocks instead

   * [exampe](045_hash_default_value.rb)

   in this example, you will find out whats makes people confuse, how to fix and
   why blocks a better solution
