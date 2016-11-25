require '31-40/035_callable'

before do
  fake_notifier = -> (user, message) {
    @sent_notifications << [user, message]
  }

  @contest = Contest.new(notifier: fake_notifier)
end
