# Breakfast, Lunch, or Dinner? (Part 1, 2, 3, 4, 5, 6)
def meal
  return 'Breakfast'
end
puts meal
# => 'Breakfast'

def meal
  'Evening'
end
puts meal
# => 'Evening'

def meal
  return 'Breakfast'
  'Dinner'
end
puts meal
# => 'Breakfast' 
# - return executed, tells method to end, lines after won't be processed.

def meal
  puts 'Dinner'
  return 'Breakfast'
end
puts meal
# => 'Dinner'
# => 'Breakfast'

def meal
  'Dinner'
  puts 'Dinner'
end
p meal
# => 'Dinner'
# => nil
# - puts return value is nil, p shows the return value

def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end
puts meal
# => 'Breakfast'