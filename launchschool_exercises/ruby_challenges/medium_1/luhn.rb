class Luhn
  def initialize(n)
    @number = n
  end

  def addends
    digits = @number.digits
    (1..digits.size - 1).step(2) do |idx|
      num = digits[idx] * 2
      digits[idx] = num > 9 ? num - 9 : num
    end

    digits.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  # def self.create(num)
  #   0.upto(9) do |digit|
  #     new_number = num * 10 + digit
  #     return new_number if new(new_number).valid?
  #   end
  # end

  def self.create(num)
    checksum_value = new(num * 10).checksum
    checksum_digit = (checksum_value % 10).zero? ? 0 : 10 - (checksum_value % 10)
    num * 10 + checksum_digit
  end
end
