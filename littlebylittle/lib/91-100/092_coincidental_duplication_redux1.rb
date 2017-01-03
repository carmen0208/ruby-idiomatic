require 'date'

# in Norway
module Calender
  module Holiday
    FEBRUARY = 2
    NOVEMBER = 11

    def mothersday(year)
      second_sunday_in(FEBRUARY, year)
    end

    def fathersday(year)
      second_sunday_in(NOVEMBER, year)
    end

    def next_mothersday(today = Data.today)
      this_years = mothersday(today.year) # !> assigned but unused variable - this_years
      if this_year >= today
        this_year
      else
        mothersday(today.year + 1)
      end
    end
    def next_fathersday(today = Data.today)
      this_years = fathersday(today.year) # !> assigned but unused variable - this_years
      if this_year >= today
        this_year
      else
        fathersday(today.year + 1)
      end
    end
 
    def second_sunday_in(month, year)
      # Day number 8 always falls within the second week of the month
      second_week = Date.new(year, month, 8) # => #<Date: 2016-02-08 ((2457427j,0s,0n),+0s,2299161j)>
      second_week +day_until_sunday(second_week) # !> even though it seems like unary operator
    end
    def day_until_sunday(date)
      (7 - date.wday) % 7 # => 6
    end
  end
end

mothersday = Object.new
mothersday.extend(Calender::Holiday).mothersday(2016) # => #<Date: 2016-02-14 ((2457433j,0s,0n),+0s,2299161j)>
