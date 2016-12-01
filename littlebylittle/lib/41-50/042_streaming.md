### How to get current memory from ruby code

```ruby
def memstats
  input = `ps ax -o pid,rss | grep -E "^[[:space:]]*#{$$}"`
  p input.strip #=> "4350   7644\n"
  
  p input.strip.split #=> ["4350", "7644"]
  p input.strip.split.map(&:to_i) #=> [4350, 7644]
  pid, size = input.strip.split.map(&:to_i)
  "Size: #{size}"
end


```

### Streaming

* (Version1)[042_streaming.rb]

  Get all data out to a CSV file and then count it. it's really un-efficient

* (Version2)[042_streaming1.rb]

  iterate CSV with foreach method, count each line and get the right put.
  
  it is good, but sometime, we can't use emurable way to list it

* (Version3)[042_streaming2.rb]

     1. Call the #each method, which iterates over rows
     2. The return value of #each when given no block is an Enumerator
        object(**his object is an external iterator over a collection. You can think of it as a lazy version of the visitors Array we created in the very first version of this program**)
     3. Using the way the Enmerator prvoded, which is count to count the values

    ```ruby
    x = [1,2,3,4,5]
    #=> [1, 2, 3, 4, 5]
    x.each
    #=> #<Enumerator: [1, 2, 3, 4, 5]:each>
    ```

## //TODO: Enumerator might be the part that can be familiar with
