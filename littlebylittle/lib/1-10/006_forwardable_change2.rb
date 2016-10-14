require 'forwardable'

class User 
#  attr_reader :account
  extend Forwardable

  # Shortcut for defining multiple delegator methods, but with no
  # provision for using a different name. 
  def_delegators :@account, :first_name, :last_name, :email_address
  def initialize(account)
    @account = account
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end

class Store
  extend Forwardable

  # :owner_email is an alias definitation of email_address, if it not bee
  # defined, it is the same as method
  def_delegator '@owner', :email_address, :owner_email
  def initialize(owner)
    @owner = owner
  end
end

GithubAccount = Struct.new(:uid, :email_address, :first_name, :last_name)
FacebookAccount = Struct.new(:login, :email_address, :first_name, :last_name)
 
carmen = User.new(GithubAccount.new("carmen0208","13770576@qq.com", "carmen","liu"))
store = Store.new(carmen)
p store.owner_email

