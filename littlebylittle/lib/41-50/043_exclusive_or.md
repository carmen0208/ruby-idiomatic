## What is exclusive or

* ^

   ```ruby
true ^ true #=> false
true ^ false #=> true
false ^ true #=> true
false ^ false #=> false
   ``` 

## Usage example: 

* [example](043_exclusive_or.rb)

## one?

what if have more than two exclusive options? please using: `one?`

**one?** is defined on Enumerable, so it’s available on more than just arrays.

```ruby
%w{ant bear cat}.one? { |word| word.length == 4 }  #=> true
%w{ant bear cat}.one? { |word| word.length > 4 }   #=> false
%w{ant bear cat}.one? { |word| word.length < 4 }   #=> false
[ nil, true, 99 ].one?                             #=> false
[ nil, true, false ].one?                          #=> true
"waldo is at the waldorf".scan(/waldo/).one? # => false
# can pass the block in
[42, 85, 34, 6, 10].one?{|e| e.odd?} # => true
require 'set'
Set.new(["just me"]).one?         # => true
```
