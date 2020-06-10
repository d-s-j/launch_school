=begin
  -Takes two sorted Arrays as arguments, and returns a new Array...
   that contains all elements from both arguments in sorted order.
  -Solution should not mutate the input arrays.
=end

def merge(a, b)
  sorted = []
  a_clone = a.clone
  b_clone = b.clone

  until a_clone.empty? || b_clone.empty? do
    a_clone.first < b_clone.first ? sorted << a_clone.shift : sorted << b_clone.shift
  end

  until a_clone.empty? && b_clone.empty? do
    a_clone.empty? ? sorted << b_clone.shift : sorted << a_clone.shift
  end
  
  sorted
end

# TEST
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

# Launch School Solution:
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end