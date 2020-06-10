puts ">> Please enter an integer greater than 0:"
number = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
action = gets.chomp

if action == 's'
  sum = (1..number).sum
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif action == 'p'
  product = (1..number).to_a.reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
end