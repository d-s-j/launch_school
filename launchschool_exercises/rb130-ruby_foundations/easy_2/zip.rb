def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |el, idx|
    result << [el, arr2[idx]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
p zip([1, 2, 3], [4, 5]) == [[1, 4], [2, 5], [3, nil]]

# Launchschool Solution:

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end