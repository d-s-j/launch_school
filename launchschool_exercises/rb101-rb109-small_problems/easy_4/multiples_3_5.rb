def multisum(number)
  (1..number).select {|num| num%3==0 || num%5==0}.inject(:+)
end