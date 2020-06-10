def leap_year?(year)
  if year >= 1752  # Gregorian Calendar
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    year % 4 == 0  # Julian Calendar
  end
end