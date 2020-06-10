def rotate_rightmost_digits(num, idx)
  num = num.to_s.chars
  save_num = num.delete_at(-idx)
  num.push(save_num).join.to_i
end

# or

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, idx)
  number = num.to_s.chars
  number[-idx..-1] = rotate_array(number[-idx..-1])
  number.join.to_i
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917