* a Symbol literal is a word with a colon in front of it
```ruby
:foo
```

* way's of how do we get **arbitrary( /'ɑrbətrɛri/  随意的, 主观的) characters**, like spaces and dashes, into a
  symbol?:

```ruby
#One way is to start with a string and use #tosym to convert it to a symbol:
"foo-bar (baz)".to_sym          # => :"foo-bar (baz)"
#more concise(简明的) and idiomatic(约定俗成的) way
:"foo-bar (baz)"                # => :"foo-bar (baz)"

# interpolate values into the quoted symbol
post_id = 123
:"post-#{post_id}"              # => :"post-123"
:'hello, "world"'               # => :"hello, \"world\""
%s{foo:bar}                     # => :"foo:bar"
```

####Notice:

* Symbols are best used for **constrained vocabularies**, like the names of options
that may be passed to a method. 
* The Ruby virtual machine has to keep a table in memory of all known symbols, 
so that it can assign a single unique integer ID to each. 
That means generating an unbounded(无限的;无边际的；极大的) set of symbols, 
from, say, user input can lead to memory leaks. 

