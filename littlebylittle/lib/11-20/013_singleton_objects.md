
##Goal: 

Write a version of Conway’s Game of Life in a semi-functional, stateless style

* Without any state, every instance would be exactly the same. And since the
objects didn’t have any need for initialization, why even bother with classes

* Singleton objects :

	* [Singleton Object](013_singleton_objects.rb)

	* A class plays two roles in an OO program:

   		* It provides a container for behavior that’s shared by many objects.
   		* It acts as an object factory, manufacturing new instances and ensuring they are initialized correctly.

	When we have an object which does not need to share behavior with any others objects, and which requires no initialization, that renders both roles of a
class superfluous. In cases like this, it can make more sense to just use a
one-off singleton object.

	Another way to accomplish this is to use a module as our singleton object, and
only define class-level methods on the module. Let’s update the example to use
this approach instead.

	* [Module plays as Singleton Object](013_singleton_objects_change2.rb)

	This is a perfectly legitimate way to implement singleton objects.
    Personally, I feel that using a singleton instance of Object is a little
    more intention-revealing, since modules are usually used as namespaces and
    as a means of sharing behavior

###Singleton objects, not the Singleton Pattern

* The Singleton Pattern describes a way to control the construction of a
  particular class such that only one instance is ever constructed. Singletons
  following this pattern have often been used to manage a great deal of
  centralized state, a situation that can lead to a number of problems,
  including thread contention and **proliferation** /prəu-,lifə'reiʃən/ 增殖,分芽繁殖 
  of dependencies.

  * The singleton objects we’ve defined here are stateless and more akin(/ə'kɪn/ 同类的；类似的) to the
    immutable singletons that Ruby provides like true, false, and nil. As such
    they are somewhat less prone to abuse.
