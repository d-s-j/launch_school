# Write a method that takes one argument, a positive integer, and returns 
# the sum of its digits.

=begin
  input: integer
  output: sum of inputs digits

  turn input integer into string
  split string by each character into array
  turn strings in array back into integer
  return sum of array
=end

def sum(num)
  num.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45 