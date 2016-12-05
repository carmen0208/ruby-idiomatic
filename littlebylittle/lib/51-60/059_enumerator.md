# Enumerator

From this episode, brings a new idea of using of Enumerator

if a method has yield a block multiple times, makes this method into Enumerator
can be fun because it could using `.next` to manipulate the code

 * [example](059_enumerator.rb)

Here's 2 points that make from the example
1. `Enumerator` takes a method that yields multiple times, and effectively turns it inside out: 
instead of the **method driving execution by yielding repeatedly to a block**, 
we can drive the method’s execution forward as needed by calling `#next` on the Enumerator.
2. One handy method Enumerator includes is `#with_index`. 
This method lets us **iterate through the yielded values with an added index variable**. 
This variable **automatically counts up with each yield**. 
We can use this to number the names

