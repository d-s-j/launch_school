=begin
  -input: array of elements
  -output: number of occurences of each elements in the array

  -DEF count_occurrences( arr, result= Hash.new(0))
    -IF arr.empty?
      -RETURN result
    -ELSE
      -result[arr.pop] += 1
      -call count_occurernces( arr, result )
    -IF END
  -DEF END


=end

def count_occurrences(arr, result = Hash.new(0))
  if arr.empty?
    result
  else
    result[arr.pop] += 1
    count_occurrences(arr, result)
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
# Expected Output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2