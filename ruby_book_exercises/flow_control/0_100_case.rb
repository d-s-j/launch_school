def check(number)
  case 
    when number < 0 then puts "#{number} is below 0."
    when number <= 50 then puts "#{number} is between 0 and 50."
    when number <= 100 then puts "#{number} is between 51 and 100."
    else puts "#{number} is above 100."
  end
end

puts "Pick a number."
number = gets.chomp.to_i
check(number)