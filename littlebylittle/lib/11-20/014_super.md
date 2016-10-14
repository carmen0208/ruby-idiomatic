##Super

* When Child inherit from class Parent, and both define a method #hello, the
  Child can reference the Parent's implementation of #hello, using super

  * [example](014_super.rb)

* If we want to call parent as the same argument, we can omit the agruments to
  super. but it **only** works if we leave off the parentheses as well.

* This makes code less brittle(/'brɪtl/易碎的，脆弱的；易生气的) because changes
  to a parent method's parameter list won't mean having to hunt around and
  update every super all that invokes.

####What if we still want to force zero arguments?

Here’s a version of Child that takes a special flag to indicate that it should use its default subject. When the flag is passed, it calls super with empty parentheses, forcing the superclass method to resort to the default value for subject

but there's still have a side effect, please see the example and find out 
* [example](014_super.rb)

####What if we want to suppress the block being passing through?

we have to use the special argument `&nil`

* [example](014_super_change1.rb)

