require 'delegate'

class BankAccount
  attr_reader :balance_cents
  def initialize(starting_balance_cents = 0) 
    @balance_cents = starting_balance_cents
  end
end

# Roles 
# - Transfer Source
# - Transfer Destination
#
class TransferSourceAccount < SimpleDelegator
  def transfer_to(recipient, amount_cents)
    if @balance_cents < amount_cents # !> instance variable @balance_cents not initialized
      raise "Insufficient funds"
    else
      @balance_cents -= amount_cents
      recipient.receive(amount_cents)
    end
  end
end

class TransferDestinationAccount < SimpleDelegator
  def receive(amount_cents)
    @balance_cents += amount_cents
  end
end

account1 = BankAccount.new(100_00)
account2 = BankAccount.new(0)
source_account = TransferSourceAccount.new(account1)
dest_account = TransferDestinationAccount.new(account2)

account1.class # => BankAccount
source_account.class # => TransferSourceAccount
account1 == source_account # => false
# it won't work since the added methods aren't actually being added to the model
# object themselves. they have no access to pricate parts of those model
# including private methods and instance_variables
source_account.transfer_to(dest_account, 50_00)
source_account.balance_cents  # => 
dest_account.balance_cents # => 

# ~> -:16:in `transfer_to': undefined method `<' for nil:NilClass (NoMethodError)
# ~> 	from -:39:in `<main>'
