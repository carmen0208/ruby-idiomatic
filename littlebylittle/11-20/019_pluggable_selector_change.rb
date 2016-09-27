SleepTimer = Struct.new(:minutes, :notifier, :notify_message) do
  def start
    sleep minutes * 60
    notifier.public_send(notify_message, "Tea is ready!")
  end
end

timer = SleepTimer.new(0.1, $stdout, :puts)
timer.start
