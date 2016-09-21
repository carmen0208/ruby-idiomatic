class User 
  attr_reader :account
  def initialize(account)
    @account = account
  end

  def first_name
    @account.first_name
  end
  def last_name
    @account.last_name
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  def email_address
    @account.email_address
  end

end

GithubAccount = Struct.new(:uid, :email_address, :first_name, :last_name)
FacebookAccount = Struct.new(:login, :email_address, :first_name, :last_name)
 
carmen = User.new(GithubAccount.new("carmen0208","13770576@qq.com", "carmen","liu"))
p carmen.full_name #=> "carmen liu"


