# class Meetup
#   SCHEDULES = [:first, :second, :third, :fourth]

#   def initialize(month, year)
#     @year = year
#     @month = month
#   end

#   def day(weekday, schedule)
#     case schedule
#     when :teenth
#       13.upto(19) do |day|
#         if Date.new(@year, @month, day).send(weekday.to_s + '?')
#           return Date.new(@year, @month, day)
#         end
#       end
#     when :last
#       -1.downto(-7) do |day|
#         if Date.new(@year, @month, day).send(weekday.to_s + '?')
#           return Date.new(@year, @month, day)
#         end
#       end
#     else
#       counter = 0
#       1.upto(31) do |day|
#         if Date.new(@year, @month, day).send(weekday.to_s + '?')
#           if counter == SCHEDULES.index(schedule)
#             return Date.new(@year, @month, day)
#           else
#             counter += 1
#           end
#         end
#       end
#     end
#   end
# end

### Refactored:

class Meetup
  SCHEDULES = {
    first:  1,
    second: 8,
    third:  15,
    fourth: 22,
    last:   -7,
    teenth: 13
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.new(@year, @month, SCHEDULES[schedule])
    date += 1 until date.send("#{weekday}?")
    date
  end
end