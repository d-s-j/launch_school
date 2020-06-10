# Write a method that takes one argument, an array containing integers, and 
# returns the average of all numbers in the array. The array will never be empty 
# and the numbers will always be positive integers.

=begin
  input: array of integers
  output: average of all integers in array input

  retrieve sum of array
  divide sum by number of elements in array
=end

def average(arr)
  arr.sum / arr.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40