=begin
  -input: positive integer
  -output: array of digits from input

  -DEF digit_list( number, result = [] )
    -initialize str_num = number.to_s
    -IF str_num.empty?
      -MAP result to integers
      -RETURN result
    -ELSE
      -result << str_num[0]
      -call digit_list( str_num[1..-1], result )
    -IF END
  -DEF END
=end

def digit_list(number, result=[])
  str_num = number.to_s
  if str_num.empty?
    result.map(&:to_i)
  else
    result << str_num[0]
    digit_list(str_num[1..-1], result)
  end
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true