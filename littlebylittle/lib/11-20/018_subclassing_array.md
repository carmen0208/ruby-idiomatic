###Topic:

if you class have some common feature of others that you do want to
impliemented. there's 2 ways to do it 
* Inheritance(Subclass of Exist Class)

    [Example](018_subclassing_array.rb)

    the issue of this example is that, when 2 arrays add together, it changed
    back to Parent method instead of the Child one.

    the reason behind is: For effiency, many core class methods are coded in C
    instead of Ruby. And in some cases, such as Array addition operator, they
    are implemented in such a way that the class of the return value is
    hardcoded.

    If we subclass core classes, such as **Array**,**String**, and **Hash**, we
    will eventually run up againest these limitations.

* Delegation(combination)

  [Example](018_subclassing_array_change.rb)

  by delegate method to Array, the function can easily worked.

  and by include **Enumerable** module and implement **each** method. all
  methods like: "#map, #select, #grep, or #group_by" can be easily implemented
  as well.

###Conclusion:

when you want something that behaves almost, but not quite, like a core Ruby class, 
just remember to use delegation rather than inheritance.
