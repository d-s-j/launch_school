# RB101 Programming Foundations > Lesson 3: Practice Problems > Easy 2
# Question 8: Shorten this sentence. Remove everything starting from "house".

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice("Few things in life are as important as ")
p advice.slice(0, 39)
p advice.slice!(0, advice.index('house'))