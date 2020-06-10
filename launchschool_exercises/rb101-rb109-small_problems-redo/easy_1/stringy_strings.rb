# Write a method that takes one argument, a positive integer, and returns a 
# string of alternating 1s and 0s, always starting with 1. The length of the 
# string should match the given integer.

=begin
  input: integer
  output: alternating '1's and '0's, length based on integer

  initialize result variable = ''
  call times method on input intger
    if index is even add '1' to result string
    if idnex is odd add '0' to result string
  return result string
=end

def stringy(num)
  result = ''
  num.times do |index|
    index.even? ? result += '1' : result += '0'
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'