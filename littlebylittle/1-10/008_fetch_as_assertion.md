###Fetch as assertion 

when fetch something like json file from somewhere：
```ruby
auth = {
  'uid'  => 12345,
  'info' => {
    'email'      => 'avdi@avdi.org'
    'first_name' => 'avdi',
    'last_name'  => 'grimm'
  },
  'credentials' => {
    'token' => "TOKEN123"
  }
}
```

the problem is:

```ruby
greeting = "Good morning, #{u.first_name.capitalize}"
greeting # => 
# ~> -:4:in `<main>': undefined method `capitalize' for nil:Ni
```

The worst thing about this error is that there’s no direct connection between the error and the missing auth info.

so here's a better way to: using Fetch: 

```ruby
u.email_address = auth['info'].fetch('email')
# ~> -:11:in `fetch': key not found: "email" (KeyError)
# ~>    from -:11:in `<main>'
```
