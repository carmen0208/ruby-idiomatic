module DomainObject
  attr_accessor :role
  def method_missing(method_name, *args, &block)
    if role && role.public_method_defined?(method_name)
      puts role.instance_method(method_name)
      puts self
      role.instance_method(method_name).bind(self).call(*args, &block)
    else
      super
    end
  end
  def respond_to_missing?(method_name, include_all=false)
    if role && role.public_method_defined?(method_name)
      true
    else
      super
    end
  end

  def play_role(role)
    self.role = role
    yield(self)
  ensure
      self.role = nil
  end
end

class BankAccount
  include DomainObject
  attr_reader :balance_cents
  def initialize(starting_balance_cents = 0) 
    @balance_cents = starting_balance_cents
  end
end

# Roles 
# - Transfer Source
# - Transfer Destination
#
module TransferSourceAccount
  def transfer_to(recipient, amount_cents)
    if @balance_cents < amount_cents
      raise "Insufficient funds"
    else
      @balance_cents -= amount_cents
      recipient.receive(amount_cents)
    end
  end
end

module TransferDestinationAccount
  def receive(amount_cents)
    @balance_cents += amount_cents
  end
end

source_account = BankAccount.new(100_00)
dest_account = BankAccount.new(0)

source_account.play_role(TransferSourceAccount) do 
  dest_account.play_role(TransferDestinationAccount) do 
    source_account.transfer_to(dest_account, 25_00)
  end
end
source_account.balance_cents  # => 7500
dest_account.balance_cents # => 2500
source_account.respond_to?(:transfer_to) # => false
dest_account.respond_to?(:receive) # => false

# >> #<UnboundMethod: TransferSourceAccount#transfer_to>
# >> #<BankAccount:0x007f873ea0d120>
# >> #<UnboundMethod: TransferDestinationAccount#receive>
# >> #<BankAccount:0x007f873ea0d0f8>
