# Day or Night?
def time_of_day(a)
  a ? (puts "It's daytime!") : (puts "It's nighttime!")
end

daylight = [true, false].sample
time_of_day(daylight)