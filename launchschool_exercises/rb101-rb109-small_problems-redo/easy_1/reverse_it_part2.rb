# Write a method that takes one argument, a string containing one or more words, 
# and returns the given string with words that contain five or more characters 
# reversed. Each string will consist of only letters and spaces. Spaces should be 
# included only when more than one word is present.

=begin
  input: string with one or more words
  output: string with letters reversed if word is 5 or more letters long

  initialize array of string split into words
  iterate through array, reverse word if length is 5 or more
  join array into string
  return string
=end

def reverse_words(str)
  str.split.map do |word|
    word.size > 4 ? word.reverse : word
  end.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS