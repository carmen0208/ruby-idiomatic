require 'active_support/all'

# in Norway
module Calender
  module Holiday
    FEBRUARY = 2
    NOVEMBER = 11

    def date_for_mothersday(today = Time.now.utc)
      today # => 2017-01-03 22:26:20 UTC
      date_for_parentsday(FEBRUARY,today)
    end

    def date_for_fathersday(today = Time.now.utc)
      date_for_parentsday(NOVEMBER,today)
    end

    def date_for_parentsday(month, today)
      close_date = Time.utc(today.year, month,8) # => 2017-02-08 00:00:00 UTC
      possible_parentsday = next_sunday_after(close_date) # => 2017-02-12 00:00:00 UTC
      if possible_parentsday >= today.beginning_of_day
        actual_parentsday = possible_parentsday
      else
        actual_parentsday = next_sunday_after(close_date + 1.year)
      end
      return actual_parentsday
    end
 
    def next_sunday_after(time)
      time # => 2017-02-08 00:00:00 UTC
      (7 - time.wday) % 7 # => 4
      1.day # => 1 day
      return time + ((7 - time.wday) % 7) * 1.day
    end
  end
end

mothersday = Object.new
mothersday.extend(Calender::Holiday).date_for_mothersday # => 2017-02-12 00:00:00 UTC
