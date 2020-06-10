# RB101 Programming Foundations > Lesson 3: Practice Problems > Hard 1
# Question 3:

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"       # => "one is: one"
puts "two is: #{two}"       # => "one is: two"
puts "three is: #{three}"   # => "one is: three"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"       # => "one is: one"
puts "two is: #{two}"       # => "one is: two"
puts "three is: #{three}"   # => "one is: three"

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"       # => "one is: two"
puts "two is: #{two}"       # => "one is: three"
puts "three is: #{three}"   # => "one is: one"