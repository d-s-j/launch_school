=begin
  Josh wants to print an array of numeric strings in reverse numerical order. 
  However, the output is wrong. Without removing any code, help Josh get the 
  expected output.
=end

arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"]

# Solution:
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Originally being called as:
(p arr.sort) do |x,y|
  y.to_i <=> x.to_i
end