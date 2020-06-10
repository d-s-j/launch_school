def time_of_day(minutes)
  minutes = minutes % (24 * 60) # minutes in a day
  hours, minutes = minutes.divmod(60)
  format('%02d:%02d', hours, minutes)
end

# or

def time_of_day(minute)
  hours, minutes = minute.divmod(60)
  hours %= 24
  format("%02d:%02d", hours, minutes)
end