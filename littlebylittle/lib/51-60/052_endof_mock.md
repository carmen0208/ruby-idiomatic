## ideas: only mock what you own

  * [example](052_endof_mock.rb)

   this example of code shows that a File in the outside should not considered
   to be mocked, here's the reason:
  
   1. it's hard to understand
   2. it is brittle, 
   3. it doesn't test the code that actually write

## Run respec 

```ruby
rspec littlebylittle/lib/51-60/052_endof_mock.rb
```
