=begin
  Featured Number = odd number, multiple of 7, digits occur once each (ex. 133 is NOT)
  Input: integer
  -initialize featured number variable = 0
  - +7 to featured number until all requirements fulfilled 
  Output: next featured number greater than the input
=end

def featured(num)
  featured = 7
  until featured > num && featured.odd? && featured.digits.uniq == featured.digits do
    featured += 7
    break if featured >= 9_876_543_210
  end

  if featured >= 9_876_543_210
    'There is no possible number that fulfills those requirements.'
  else
    featured
  end
end

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Launch School Solution:
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end