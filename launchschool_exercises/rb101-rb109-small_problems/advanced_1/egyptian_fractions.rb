=begin
  input: Rational Number(total)
    initiate result = [] 
    initiate denominator_counter = 1
    LOOP
      unit_fraction = Rational(1 / denominator_counter)
        IF 1/1 is < total 
          total unit_fraction - unit_fraction
          result << unit_fraction.denominator
        END
      denominator + 1
    BREAK LOOP, total = 0

  output: return result array, all denominators of egyptian total
=end

def egyptian(total)
  result = []
  denominator = 1

  until total == 0
    unit_fraction = Rational(1, denominator)
    if unit_fraction <= total
      total -= unit_fraction
      result << unit_fraction.denominator
    end

    denominator += 1
  end

  result
end

def unegyptian(denominators)
  sum = []
  denominators.each do |d|
    sum << Rational(1, d)
  end
  sum.sum
end



egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Launch School Solution:
def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
end