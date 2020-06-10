def negative(num)
  num > 0 ? -num : num
end

# or

def negative(number)
  -number.abs
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0