# How implicit Splate works and what's the problems?

* [example](081_implicit_splat.rb)

An explicit splat could be said to be more “duck-type-safe” than an implicit one. 
If we write code with explicit splats on the right side of an assignment, 
it will work so long as the input object is convertible to an Array. 
Whereas if we rely on implicit splatting, the input must be an actual Array or 
something very close to one. 

### Implicit splatting can also occur on the left side of an assignment.

### Splat hash :

* [example](081_implicit_splat_hash.rb)

If we want to work with keys and value separately, we can provide a block that
takes two separate arguments, but if we want to work with key/value pairs as a
unit, we can supply just one block argument. 
