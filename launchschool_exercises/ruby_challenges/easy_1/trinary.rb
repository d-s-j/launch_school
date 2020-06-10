class Trinary
  BASE = 3

  def initialize(trinary_str)
    @trinary = valid_trinary?(trinary_str) ? trinary_str : '0'
  end

  def to_decimal
    digits = @trinary.each_char.map(&:to_i).reverse
    digits.map.with_index { |n, idx| n * (BASE**idx) }.sum
  end

  def valid_trinary?(str)
    str.match(/\A[0-2]+\z/)
  end
end
