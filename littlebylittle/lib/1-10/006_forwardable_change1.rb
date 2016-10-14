require 'forwardable'

class User 
  attr_reader :account
  extend Forwardable

  def_delegators :account, :first_name, :last_name, :email_address
  def initialize(account)
    @account = account
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

end

GithubAccount = Struct.new(:uid, :email_address, :first_name, :last_name)
FacebookAccount = Struct.new(:login, :email_address, :first_name, :last_name)
 
carmen = User.new(GithubAccount.new("carmen0208","13770576@qq.com", "carmen","liu"))
p carmen.full_name #=> "carmen liu"


