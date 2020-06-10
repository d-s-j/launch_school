=begin
  -DEF is_odd? ( number, odd_check=false )
    -IF number is greater than 1
      -call method( number - 1, reassign odd_check to opposite boolean )
    -ELSE return odd_check
    -IF END
  -DEF END
  
  *EDGE CASES: Before recalling method, make sure 'number' is positive. (Use .abs method)
=end

def is_odd?(num, odd_check=false)
  num.abs >= 1 ? is_odd?(num.abs - 1, !odd_check) : odd_check
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true