DIGITS = {
  '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, 
  '6'=> 6, '7'=> 7, '8'=> 8, '9'=> 9, '0'=> 0
}

def string_to_signed_integer(str)
  pos_or_neg = 0
  if str[0] == '+'
    pos_or_neg += 1
    str.slice!(0)
  elsif str[0] == '-'
    pos_or_neg -= 1
    str.slice!(0)
  else
    pos_or_neg += 1
  end

  number = str.chars.map! do |num| 
    DIGITS[num]
  end.inject { |sum, i| sum * 10 + i }
  
  number * pos_or_neg
end

# or

def string_to_integer(str)
  str.chars.map! do |num| 
    DIGITS[num]
  end.inject { |sum, i| sum * 10 + i }
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end