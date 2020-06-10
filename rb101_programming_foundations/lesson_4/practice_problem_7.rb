statement = "The Flintstones Rock"

statement = statement.scan(/\w/)
result = statement.each_with_object(Hash.new(0)) do |letter, hash|
  hash[letter] += 1
end

result.sort

=begin
-RULES
  -Create a hash showing amount of letters present in a string
-START
  -Split string by letters
  -Create a new hash with a default value of 0
  -Iterate & Assign letter as key in hash
    -Increment value of key(letter) by 1 for each letter present
-END
=end

# or

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end