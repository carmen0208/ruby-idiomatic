class Contest
  def initialize(option={})
    # users #fetch to see if a notifier has been supplied in the options, 
    # If not, it subsitutes a simple lambda.
    # @notifier = option.fetch(:notifier) {
    #  -> (user, message) {
    #    puts "Message to #{user.name}: #{message}"
    #  }
    #}
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
  def send_sms(message)
    puts "Sending SMS: #{message}"
  end
end

#we’ve seen five different kinds of object which respond to the #call message
#1. A lambda
c = Contest.new
c.choose_winner

#3. A symbol converted to a Proc
p :send_sms.to_proc
c = Contest.new(notifier: :send_sms.to_proc)
c.choose_winner


# 4. A class implementing the #call method explicitly
class FacebookNotifier
  def initialize(auth_info)
    @auth_info = auth_info
  end
  def call(user, message)
    puts "Hey #{user.name}, this is a message from Facebook Notifier:#{message}"
  end
end

auth_info = "123"
fb_notifier = FacebookNotifier.new(auth_info)
c = Contest.new(notifier: fb_notifier)
c.choose_winner

