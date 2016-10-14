## Fetch and Error Raise

we told about fetch before, and when fetch something that the key is not exist,
it could raise an error..

```ruby
def user_name(params)
  params.fetch(:username)
end

user_name(username: 'Frank')    # => "Frank"
user_name({})                   # => 
# ~> -:2:in `fetch': key not found: :username (KeyError)
# ~>    from -:2:in `user_name'
# ~>    from -:6:in `<main>'

```

but sometimes, we don't really care about the missing of keys, we'd like to just
replace it tiwh placeholder and keep going. like following:

```ruby
def greet(params)
  name = user_name(params) rescue "Anonymous"
  puts "Hello, #{name}"
end
```
## It has an issue:

see [example](022_inline_rescue_issue.rb)

rescuring an overly-general exception class is a common source of errors in
software, Since **the statement-modifier form of rescue** can't take an
exception class to match, it is overly broad by definition. (Code Smell)


## Here's some rule:

Occasionally, we may want to convert an exception to a return value, for
instance if we want to examine the exception before decifing to re-raise it. log
it or handle it some other way. Inline resuce give us an elegant way to
accomplish this.


[solution](022_inline_rescue_solution.rb)

