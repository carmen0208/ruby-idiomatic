# Why memoize?

for better performance

# 2 ways to memoize

* file that need to be memoize
 
  [example](048_memoize.rb)

* this is the one commonly use, but it would makes code everywhere

  [example](048_memoized1.rb)

* This is decoupling it throught module, which is advanced!

  [example](048_memoized2.rb)


### Extensive reference:

* Design Pattern: delegation/Proxy

  [example](048_proxy.rb)
* Unbunded method

  [exampe](048_unbound_method.rb)

* useful methods of metaprogramming 
   * define_method
   
      ```ruby
      define_method do |*args, &block|
      #...
      end
      ```
   
   * instance_method
   * instance_variable_defind?
   * instance_variable_get(var)
   * instance_variable_set(var, value) 

### Why using Model instead of Proxy?

By Using proxy, when  call the method, is should instance Proxy Class and call method of Proxy
instead of the real Class

By using unbound method, it's easy for Real Class add an proxy without letting
Client knows about, when call the method, it remain the same


