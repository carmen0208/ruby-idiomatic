## simple usage of default Hash

```ruby
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
word_count
# => {"i'm"=>4,
#     "your"=>3,
#     "only"=>2,
#     "friend"=>4,
#     "not"=>2,
#     "but"=>3,
#     "a"=>1,
#     "little"=>1,
#     "glowing"=>1,
#     "really"=>1,
#     "actually"=>1,
#     "i"=>1,
#     "am"=>1}
```

### Instead of defaulting the count to 0 in the word-count code, we can instantiate the hash with a default block. This block will be called if, and only if, an attempt is made to retrieve a missing value

```ruby
word_count = Hash.new do |hash, missing_key|
  hash[missing_key] = 0
end

text.split.map(&:downcase).each do |word|
  word_count[word] += 1
end

```

#### We can access the default block after the hash is initialized by sending it the #default_proc message
```ruby
h = Hash.new do |hash, missing_key|
  hash[missing_key] = 0
end
h.default_proc # => #<Proc:0x87e23b0@-:1>
h.default_proc.call({}, :foo) # => 0
 
```

#### Advantage: we create a hash whose default value is another hash, whose default value is another hash… and so on

This enables us to set hash keys nested to an arbitrary depth, without first initializing the intervening hashes

```ruby
config = Hash.new do |h,k|
  h[k] = Hash.new(&h.default_proc)
end
 
config[:production][:database][:adapter] = 'mysql'
config[:production][:database][:adapter] # => "mysql"
```

#### Example: 

 If the key hasn’t been referenced before, the weather temperature for that region is fetched. 
 
 If the same region is retrieved again, the saved value in the hash will be returned instead of another HTTP request being made

```ruby
require 'open-uri'
require 'cgi'
require 'nokogiri'
temperature = Hash.new do |h, town|
  url = "http://www.google.com/ig/api?weather=" +
    CGI.escape(town)
  h[town] = open(url) do |body|
    Nokogiri::XML(body).
      at_css('current_conditions temp_f')['data']
  end
end
 
temperature['Shrewsbury, PA']       # => "64"
```
