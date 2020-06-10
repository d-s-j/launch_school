def digit_list(num)
  str = num.to_s.split("")
  str.map { |num| num.to_i }
end

# or

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# or

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end