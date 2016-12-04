## What's the following things mean?

```ruby
__FILE__
"$PROGRAM_NAME: #{$PROGRAM_NAME}"
```

run directly from the file 

```sh
ruby 055_runable_real.rb
#=> __FILE__ 055_runable_real.rb
#=> $PROGRAM_NAME: 055_runable_real.rb
```

run from other file that include the 055_runable_real.rb

```sh
ruby 055_runable_fake.rb
__FILE__ /Users/carmen/Work/workspaces/Learn/Ninja Code/Ruby/ruby-idiomatic/littlebylittle/lib/51-60/055_runable_real.rb
$PROGRAM_NAME: 055_runable_fake.rb
```

so the result it, `__FILE__` is the location where the file at,
`$PROGRAM_NAME` is the name that we run the file


