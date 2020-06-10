class Sieve
  attr_reader :range

  def initialize(limit)
    @range = (2..limit).to_a
  end

  def primes
    prime_numbers = range.clone
    num = 2
    until num**2 > range.last
      prime_numbers.delete_if do |n|
        (n % num).zero? && num != n
      end
      num += 1
    end

    prime_numbers
  end
end
