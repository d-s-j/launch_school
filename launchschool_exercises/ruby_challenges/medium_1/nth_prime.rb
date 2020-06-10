class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    number = 1
    counter = 0
    until counter == n
      number += 1
      counter += 1 if prime?(number)
    end

    number
  end

  def self.prime?(num)
    2.upto(Math.sqrt(num)) do |n|
      return false if num % n == 0
    end
    true
  end
end
