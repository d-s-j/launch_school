puts "==> Enter the first number:"
first_number = gets.to_f
puts "==> Enter the second number:"
second_number = gets.to_f

%w( + - * / % ** ).each do |operator|
  answer = first_number.method(operator).(second_number)
  puts "==> #{first_number} #{operator} #{second_number} = #{answer}"
end

# or

# %i( + - * / % ** ).each do |operator|
#   answer = [first_number, second_number].reduce(operator)
#   puts "==> #{first_number} #{operator} #{second_number} = #{answer}"
# end