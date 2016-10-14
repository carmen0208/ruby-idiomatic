require '11-20/017_pay_it_forward'

describe Shell1 do
  describe "#at" do
    it "executes `at` with the given time and command" do
      Shell1.should_receive(:execute).with("at", ["now + 3 minutes"], "espeak 'tea is ready!'")
      at("now + 3 minutes", "espeak 'tea is ready!'", "espeak 'tea is ready!'")
    end
  end
end

