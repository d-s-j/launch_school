class Palindromes
  def initialize(max_factor: nil, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindrome_factors = []
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |f|
      @palindrome_factors << f if palindrome?(f[0] * f[1])
    end

    @palindrome_factors
  end

  def largest
    Struct.new(:value, :factors).new(max_value, max_factors)
  end

  def smallest
    Struct.new(:value, :factors).new(min_value, min_factors)
  end

  private

  def max_factors
    @palindrome_factors.select { |f| f.inject(:*) == max_value }
  end

  def min_factors
    @palindrome_factors.select { |f| f.inject(:*) == min_value }
  end

  def max_value
    @palindrome_factors.map { |f| f.inject(:*) }.max
  end

  def min_value
    @palindrome_factors.map { |f| f.inject(:*) }.min
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
