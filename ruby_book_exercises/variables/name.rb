puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello, #{first_name} #{last_name}!"

# puts "Hello " + first_name + " " + last_name

10.times do
  puts first_name + " " + last_name
end