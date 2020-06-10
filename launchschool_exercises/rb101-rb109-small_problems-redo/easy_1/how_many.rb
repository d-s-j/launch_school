# Write a method that counts the number of occurrences of each element in a 
# given array.

=begin
  input: array
  output: hash displaying number of occurences for each element in input array

  initialize a hash default value of 0, iterate through array
    -make new element a key and +1 to value
    -if already existing key then +1 to value
  return hash
=end

def count_occurrences(arr)
  arr.each_with_object(Hash.new(0)) do |ele, hsh|
    hsh[ele] += 1
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)