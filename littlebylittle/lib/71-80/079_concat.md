## How to adds 2 lists together??

#### [Problems of using shovel (`<<`)](079_concat_shovel.rb)

#### [Problems of using `+=` operation](079_concat_addequal.rb)

With addequal, it in actually add two lists together and put the new list to the
orignal one

```ruby
list1 = ['a','b','c']
list2 = ['d','e','f']
list1 += list2 
#equals:
list1 = list1 + list2
# equals
list3 = list1 + list2
#it's an new list aready
```

#### [Using concat](079_concat_concat.rb)

with concat, the list is still the orignal one

```ruby
shared_list = ["bread", "milk", "granola"]
stacey = Shopper.new(shared_list)
avdi   = Shopper.new(shared_list)
stacey.list.concat(["swiss", "brie", "cheddar"])
stacey.list                     # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
avdi.list                       # => ["bread", "milk", "granola", "swiss", "brie", "cheddar"]
stacey.list.object_id           # => 70169142021400
avdi.list.object_id             # => 70169142021400
#object_id is the same means it is the same object
```

#### [Performance comparison](079_concat_comparison.rb)

