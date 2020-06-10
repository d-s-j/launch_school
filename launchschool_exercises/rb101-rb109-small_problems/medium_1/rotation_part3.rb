def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(num, idx)
  number = num.to_s.chars
  number[-idx..-1] = rotate_array(number[-idx..-1])
  number.join.to_i
end

def max_rotation(num)
  (num.to_s.length).downto(2) do |i|
    num = rotate_rightmost_digits(num, i)
  end
  num
end

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845