## DCI (“Data, Context, Interaction”)

DCI separates the concept of domain model objects and that of specific roles
thoses objects may play. 

A common Example

```ruby
class BackAccount
  attr_reader :balance_cents

  def initialize(starting_balance_cents = 0) 
    @balance_cents = starting_balance_cents
  end
end

# Roles
# - Transfer Source
# - Transfer Destination
```

#####Way 1: we can implement DCI in Ruby is with modules and the #extend method

[example](091_rebinding_methods1.rb)

* One of the objections to this approach is that once an object has been extended with a module, it can never be un-extended. So there is no way to mix in a role and then remove it, or swap it out for another role, during the lifetime of that object.
* calling #extend can have a widespread performance impact

####Way 2: represent them with classes inheriting from SimpleDelegator

[example](091_rebinding_methods2.rb)

####Way 3: rebinding_methods in Ruby 2

[example](091_rebinding_methods3.rb)

* Unlike when we used the module extension approach, once the transaction is done, neither account object retains its temporary role or the methods associated with it
* And unlike the approach using SimpleDelegator, we worked directly with the domain model objects at all times, never with proxies



#### Reference
* public_method_defined?
* instance_method(method_name).bind(self).call(*args, &block)

```ruby
instance_method(method_name
# >> #<UnboundMethod: TransferSourceAccount#transfer_to>
self
# >> #<BankAccount:0x007f873ea0d120>
```


