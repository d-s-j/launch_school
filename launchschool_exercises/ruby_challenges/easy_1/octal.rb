class Octal
  BASE = 8

  def initialize(octal_str)
    @octal = valid_octal?(octal_str) ? octal_str : '0'
  end

  def to_decimal
    digits = @octal.each_char.map(&:to_i).reverse
    digits.map.with_index { |n, idx| n * (BASE**idx) }.sum
  end

  def valid_octal?(str)
    str.chars.all?('0'..'7')
  end
end

