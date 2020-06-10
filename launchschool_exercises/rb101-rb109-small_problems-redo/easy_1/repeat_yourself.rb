# Write a method that takes two arguments, a string and a positive integer, 
# and prints the string as many times as the integer indicates.

=begin
  input: string, integer
  output: string repeated as many times as the integer

  call times method on integer input
    call puts method on string input in times method block
=end

def repeat(str, amount)
  amount.times { puts str }
end

repeat('Hello', 3)
