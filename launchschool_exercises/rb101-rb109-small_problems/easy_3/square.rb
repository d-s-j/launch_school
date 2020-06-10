def multiply(a, b)
  a * b
end

def square(a)
  multiply(a, a)
end

def power(a, b)
  result = 1
  b.times { |_| result = multiply(result, a) }  
  result
end