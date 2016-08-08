require 'active_model'

class User
  # only include ActiveModel::Validations instead of inheritage from ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessor :password

  validate do
    errors.add(:base, "Don't let dad choose the password.") if password == '1234'
  end
end

user = User.new
user.password = '12345'
p user.valid?        # => true
#user.save!   # => undefined method `save!' for #<User:0x007fbe3d00b948> (NoMethodError)

require_relative '../test/assertions'
assert user.valid?



user.password = '1234'
user.valid?        # => false


assert_false user.valid?

