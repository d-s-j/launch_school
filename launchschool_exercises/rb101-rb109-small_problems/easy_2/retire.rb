puts "What is your age?"
age = gets.to_i

puts "At what age would you like to retire?"
retire_age = gets.to_i

current_year = Time.now.year
work_left = retire_age - age
retirement_year = 2019 + work_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{work_left} years of work to go!"