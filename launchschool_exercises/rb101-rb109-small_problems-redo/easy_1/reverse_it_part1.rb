# Write a method that takes one argument, a string, and returns a new 
# string with the words in reverse order.

=begin
  input: sentence as string object
  output: input with words reversed

  initialize a result array
  split input by each word
  pop each word from split array into result array
  join result array
=end

def reverse_sentence(str)
  reversed = []
  str = str.split

  (str.size).times do
    reversed << str.pop
  end

  reversed.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse
