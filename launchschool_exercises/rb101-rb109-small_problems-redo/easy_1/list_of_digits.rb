# Write a method that takes one argument, a positive integer, and returns 
# a list of the digits in the number.

=begin
  input: integer
  output: array - digits of input

  convert input into string
  split the string by each character
  convert strings back to integer
  return array 
=end

def digit_list(num)
  num.to_s.split('').map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true