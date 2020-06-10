# RB101 Programming Foundations > Lesson 3: Practice Problems > Easy 2
# Question 1: For this practice problem, write a one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right:
(0..10).each { |add| puts (" " * add) + "The Flintstones Rock!" }
10.times { |add| puts (" " * add) + "The Flintstones Rock!" }