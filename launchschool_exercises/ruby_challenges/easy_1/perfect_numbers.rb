class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0

    sum = (1..(number/2)).inject do |sum, n|
      (number % n).zero? ? sum + n : sum
    end
    
    case
    when sum > number then 'abundant'
    when sum < number then 'deficient'
    else 'perfect'
    end
  end
end