##Forwardable
####How to use it :
1. require 'forwardable'
2. extend Forwardable
3. def_delegators or def_delegator

####Knowledge:

* What if we didn’t want to expose delegator(account in the example) as a readable attribute? 
What if we wanted to keep it as a private instance variable only? 
That’s fine; we need only update the def_delegators declaration to use the name 
of the instance variable, including the ‘ @’ sign.
* evaluatable string(@owner in this example) can be used as the target of the delegation.
* If you use Rails, you may already be familiar with the similar delegate method provided by ActiveSupport. While Forwardable isn’t quite as featureful as delegate, and has an arguably more awkward syntax, it’s available out of the box in any Ruby installation, so it’s a good library to know how to use. It’s especially handy when building gems, where adding dependencies to extension libraries like ActiveSupport is generally frowned-upon.
