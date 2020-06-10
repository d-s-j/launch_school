def fibonacci(n)
  num1 = 0
  num2 = 1
  n.times do
    temp = num1                      
    num1 = num2            
    num2 = temp + num2  
  end
  
  num1
end

# or

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end

  last
end

 fibonacci(20) == 6765
 fibonacci(100) == 354224848179261915075
 fibonacci(100_001) # => 4202692702.....8285979669707537501