class Contest
  def initialize(option={})
    # users #fetch to see if a notifier has been supplied in the options, 
    # If not, it subsitutes a simple lambda.
    @notifier = option.fetch(:notifier) {
      -> (user, message) {
        puts "Message to #{user.name}: #{message}"
      }
    }

  end
  def choose_winner
    #winning_user = "default_Carmen"
    winning_user = User.new("carmen")
    @notifier.call(winning_user, "You're a lucky winner!")
  end
end

class User
  attr_accessor :name
  def initialize (name)
    @name = name
  end
  def send_sms(message)
    puts "Sending SMS from user's method to_proc: #{message}"
  end
end


#3. A symbol converted to a Proc
p :send_sms.to_proc
c = Contest.new(notifier: :send_sms.to_proc)
c.choose_winner
