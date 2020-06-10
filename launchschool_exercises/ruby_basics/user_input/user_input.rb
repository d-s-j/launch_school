# -Repeat after me-
# puts "Type anything."
# puts gets

# -Your age in Months-
# puts "What is your age in yours?"
# age = gets.to_i*12
# puts "You are #{age} months old."

# -Print Something-
# puts "Do you want me to print something? (y/n)"
# answer = gets.chomp
# puts "something" if answer == "y"

# -Print Something (Part 2)-
# puts "Do you want me to print something? (y/n)"
# loop do
#   answer = gets.chomp
#   if answer == "y" || answer == "Y"
#     puts "something"
#     break
#   elsif answer == "n" || answer == "N"
#     break
#   else
#     puts "Invalid input. (y/n)"
#   end
# end

# -Launch School Printer (Part 1)-
# puts ">>How many times do you want to print 'Launch School is the best!'?
# >>Enter a number greater than 2."
# loop do
#   amount = gets.chomp.to_i
#   if amount < 3
#     puts "Please enter a number greater than 2."
#     next
#   else
#     amount.times do puts "Launch School is the best!" end
#     break
#   end
# end

# -Passwords-
# USERNAME = "admin"
# PASSWORD = "Secret"
# loop do
#   puts ">>Please enter your username:"
#   name = gets.chomp
#   puts ">>Please enter your password:"
#   pass = gets.chomp
#   name == USERNAME && pass == PASSWORD ? (puts "Welcome!"; break) : (puts ">>Invalid username and/or password.")
# end