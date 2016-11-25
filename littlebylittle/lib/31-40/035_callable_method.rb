class Contest
  def initialize(option={})
    #2. A method object
    @notifier = option.fetch(:notifier) {
      method(:notify_user_by_email)
    }

  end
  def choose_winner
    #winning_user = "default_Carmen"
    winning_user = User.new("carmen")
    @notifier.call(winning_user, "You're a lucky winner!")
  end
  def notify_user_by_email(user, message) 
    puts "Hey #{user.name}, this is a message from methods:#{message}"
  end
end

class User
  attr_accessor :name
  def initialize (name)
    @name = name
  end
end

#we’ve seen five different kinds of object which respond to the #call message
c = Contest.new
c.choose_winner
