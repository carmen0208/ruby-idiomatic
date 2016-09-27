CommandResult = Struct.new(:status, :output)

class Shell
  def execute(command, flags=[], input=nil)
    result = CommandResult.new
    IO.popen([command, *flags], 'w+', err: [:child, :out]) do |io|
      io.write(input) if input
      io.close_write
      result.output = io.read
    end
    result.status = $?
    result
  end
end

#require 'rspec/autorun'

describe "#at" do 
  it "executes `at` with the given time and command" do 
    Shell.should_receive(:execute).with("at", ["now + 3 minutes"], "espeak 'tea is ready!'")
    at("now + 3 minutes", "espeak 'tea is ready!'", "espeak 'tea is ready!'")
  end
end

def at(timespec, what)
  Shell.execute("at", [timespec], what)
end

def atp()
  Shell.execute("atq").output
end
