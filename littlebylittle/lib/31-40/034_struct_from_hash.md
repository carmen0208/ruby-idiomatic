## Struct vs OpenStruct

* Struct are always instantiated with positional arguments
* OpenStruct are instantialed with a hash of keys and values

```ruby
require 'ostruct'
s = Struct.new(:foo, :bar).new(42,23)
os = OpenStruct.new(foo: 42, bar: 23)
```

#### Makes Struct support Hash instantiation

* [Example](034_struct_from_hash.rb)

#### Knowledge 

* **members** in Struct
   
```ruby
# struct.members    -> array
    #  
    # Returns the struct members as an array of symbols:
    # 
    #    Customer = Struct.new(:name, :address, :zip)
    #    joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
    #    joe.members   #=> [:name, :address, :zip]
```

#### clue

* One of the questions I received in response to the Struct episode was whether making use of the introspection and enumerability features of a Struct would couple code too closely to the implementation of the object, and make it harder to migrate to a non-struct class later on. I think this is an excellent question. As I’ve shown here, the introspective capabilities of Struct are quite useful internally, as part of the implementation details of methods. However, I would generally refrain from using Struct-specific methods like the #members method from outside of the class. 
