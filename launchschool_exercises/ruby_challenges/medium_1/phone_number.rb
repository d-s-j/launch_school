class PhoneNumber
  INVALID_NUM = '0000000000'

  attr_reader :number

  def initialize(number)
    @number = format(number)
  end

  def format(num)
    digits = num.scan(/\d+/).join
    return INVALID_NUM if num.match?(/[a-z]+/i) ||
                          digits.size < 10 || digits.size > 11 ||
                          digits.size == 11 && digits[0] != '1'
    
    digits.size == 11 ? digits[1..-1] : digits
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3, 3]}-#{number[6, 4]}"
  end
end