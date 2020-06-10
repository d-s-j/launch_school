DIGITS = {
  '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, 
  '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, '0'=> 0
}

def string_to_integer(str)
  str.chars.map! do |num| 
    DIGITS[num]
  end.inject { |sum, i| sum * 10 + i }
end