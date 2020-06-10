# RB101 Programming Foundations > Lesson 3: Practice Problems > Hard 1
# Question 2: What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# => {:a=>"hi there"}