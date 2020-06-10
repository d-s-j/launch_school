# RB101 Programming Foundations > Lesson 3: Practice Problems > Medium 1
# Question 3: How can you make this work without using begin/end/until? And handle 0 or negative numbers.

def factors(number)
  if number <= 0
    puts "Invalid Input."
    return
  end

  divisor = number
  factors = []

  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end

  factors
end