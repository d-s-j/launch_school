# RB101 Programming Foundations > Lesson 3: Practice Problems > Medium 2
# Question 5: How can we refactor this practice problem to make the result easier to predict?

def assign(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
assigning(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"