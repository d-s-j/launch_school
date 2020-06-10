=begin
  input: integer
  output: string
  notes:
    - 4 = IV, 9 = IX
    - 40 = XL, 90 = XC
=end

module RomanNumerals
  def to_roman
    roman_numerals = { 
      'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
      'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
      'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 
    }
    
    number = self

    roman_numerals.each_with_object('') do |(k, v), result|
      result << k * (number / v)
      number = number % v
    end
  end
end

Integer.include(RomanNumerals)