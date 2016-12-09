## If an array called a method without block, the would return a enumerator,
which is convenient for us to do with it


* [example of how others function contains enumerate](064_yield_or_enumerate.rb)

* [implements enum in yield](064_yield_or_enumerate1.rb)
* [implements enum in yield(enhancement)](064_yield_or_enumerate2.rb)
   
   it enhancemented by add __callee__ to to_enum method, it eliminate the
   duplication of the method name and ensure that if we ever change the name of
   the method the call to to_enum will continue work
