=begin
 Write a method that takes a 3 x 3 matrix in Array of Arrays format...
 and returns the transpose of the original matrix. 
  input: nested arrays = arr

  -initialize new array with 3 nested arrays: new_arr = [[][][]]
  -FOR EACH INDEX in arr
    -PUSH arr[nest1][ele1] into new_arr[first index]
    -PUSH arr[nest2][ele2] into new_arr[second index]
    -PUSH arr[nest3][ele3] into new_arr[third index]
  -END EACH INDEX

  RETURN new_arr

  output: transpose of original array
=end

def transpose(matrix)
  new_arr = [[],[],[]]
  matrix.each_index do |idx|
    new_arr[0] << matrix[idx][0]
    new_arr[1] << matrix[idx][1]
    new_arr[2] << matrix[idx][2]
  end
  new_arr
end

# REFACTORED - can work for any size (n x n)
def transpose(matrix)
  new_arr = []
  matrix.each_with_index do |nest, matrix_idx|
    nest.each_index do |nest_idx|
      new_arr << matrix[nest_idx][matrix_idx]
    end
  end
  new_arr.each_slice(matrix.count).to_a
end

# TEST
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Launch School Solution:
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_nest = (0..2).map { |nest_index| matrix[nest_index][column_index] }
    result << new_nest
  end
  result
end
