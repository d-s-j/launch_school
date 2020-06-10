# --Dividing Numbers--
# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
# numerator = nil
# loop do
#   puts "Please enter the numerator:"
#   numerator = gets.chomp
#   break if valid_number?(numerator)
#   puts "Invalid input. Only integers are allowed." 
# end
# denominator = nil
# loop do
#   puts "Please enter the denominator:"
#   denominator = gets.chomp
#   if denominator == '0'
#     puts "Invalid input. A denominator of 0 is not allowed."
#   else
#     break if valid_number?(denominator)
#     puts "Invalid input. Only integers are allowed." 
#   end
# end
# answer = (numerator.to_i/denominator.to_i)
# puts "#{numerator} / #{denominator} is #{answer}."


# --Launch School Printer (Part 2)--
# loop do
#   puts 'How many output lines do you want? Enter a number >=3 (Q to quit):'
#   input = gets.chomp
#   break if input.downcase == 'q'
#   lines = input.to_i
#   lines < 3? puts("That's not enough lines") : puts("Launch School is the best \n" * lines)
# end

# --Opposites Attract--
# loop do
#   puts ">> Please enter a positive or negative integer:"
#   int_one = gets.to_i
#   puts ">> Please enter another positive or negative integer:"
#   int_two = gets.to_i
#   if int_one == 0 || int_two == 0
#     puts ">> Invalid input. Only non-zero integers are allowed."
#     next
#   elsif int_one > 0 && int_two > 0 || int_one < 0 && int_two < 0
#     puts ">> Sorry. One integer must be positive, one must be negative."
#     puts ">> Please start over."
#     next
#   else
#     answer = int_one + int_two
#     puts "#{int_one} + #{int_two} = #{answer}"
#     break
#   end
# end