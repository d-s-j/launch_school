# RB101 Programming Foundations > Lesson 3: Practice Problems > Easy 1
# Question 6: show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."
puts "Four score and " + famous_words
puts "Four score and ".concat(famous_words)

puts famous_words.prepend("Four score and ")