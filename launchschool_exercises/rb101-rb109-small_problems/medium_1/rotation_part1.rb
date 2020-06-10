def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push(new_arr.shift)
end

# or

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# Further Exploration:
# Write a method that rotates a string or integer instead of an array.

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(int)
  rotate_array(int.to_s.chars).join.to_i
end

def rotate(obj)
  return rotate_integer(obj) if obj.is_a?(Integer)
  return rotate_string(obj)  if obj.is_a?(String)
  return rotate_array(obj)   if obj.is_a?(Array)
  "Please input a integer, string, or an array."
end


rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true