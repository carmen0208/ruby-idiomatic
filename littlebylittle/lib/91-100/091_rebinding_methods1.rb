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
source_account.extend(TransferSourceAccount)
dest_account.extend(TransferDestinationAccount)

source_account.transfer_to(dest_account, 50_00)
source_account.balance_cents  # => 5000
dest_account.balance_cents # => 5000

