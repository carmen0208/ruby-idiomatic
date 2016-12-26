Attendee = Struct.new(:email)

Attendance = Struct.new(:event, :attendee, :plus_one) do 
  alias_method :plus_one?, :plus_one
  # refactoring and resolve problem 2
  def heads
    if plus_one?
      2
    else
      1
    end
  end
end

Event = Struct.new(:name, :capacity, :attendances) do 
  def initialize(*)
    super
    self.attendances ||= []
  end
  # Problem 1: A new comer to the code might reasonably expect this method to
  # return a list of Attendee object, but in fact it returns an integer counts.
  # changes to : head_count returns a number
  def head_count
    attendances.reduce(0) {|count, attendance|
      # Problem 2 : the if/else conditional based on the plus_one is repected in
      # both the attendss and add_attendance method, not only duplicationm, it
      # looks like feature envy: a code smell wherein a class seems more
      # interested in another object's methods than it is in its own
      count + attendance.heads
    }
  end

  def add_attendance(attendance)
    if head_count + attendance.heads > capacity
      raise "Sorry, this event is full!"
    else
      attendances << attendance
    end
  end

end
