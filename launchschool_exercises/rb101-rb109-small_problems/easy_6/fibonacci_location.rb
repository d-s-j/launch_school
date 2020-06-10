def find_fibonacci_index_by_length(length)
  num1 = 0
  num2 = 1
  location = 0

 loop do
  fib_num = num1                      
  num1 = num2            
  num2 = fib_num + num2  
  break if fib_num.to_s.size >= length
  location += 1
 end

 p location
end

# or

def find_fibonacci_index_by_length(num = 2)
  base = [1,1]
  while num > base[-1].digits.size do 
    base << (base[-1] + base[-2])
  end
  base.index(base[-1])
end