=begin
  1st row = 3rd column
  2nd row = 2nd column
  1st row = 1st column
=end

def rotate90(matrix)
  rows = matrix.size
  columns = matrix[0].size
  new_matrix = []

  columns.times do |c_idx|
    (rows-1).downto(0) do |r_idx|
      new_matrix << matrix[r_idx][c_idx]
    end
  end

  new_matrix.each_slice(rows).to_a
end

# REFACTORED - multiple rotations
def rotate90(matrix, n = 1)
  rows = matrix.size
  columns = matrix[0].size
  new_matrix = []

  columns.times do |c_idx|
    (rows-1).downto(0) do |r_idx|
      new_matrix << matrix[r_idx][c_idx]
    end
  end

  new_matrix = new_matrix.each_slice(rows).to_a
  n > 1 ? rotate90(new_matrix, n-1) : new_matrix
end

# TEST
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Launch School Solution:
def rotate90(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end