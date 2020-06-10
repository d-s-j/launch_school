# RB101 Programming Foundations > Lesson 2 > Practice 3
# 3) a method that takes an array of integers, and returns a new array with every other element

=begin
START
# Given an array of integers called "numbers"
SET index_count = 0
SET new_numbers = []
WHILE numbers index is less than numbers length minus 1
  PUSH numbers[index_count] into new_numbers
  index_count = index_count + 2
PRINT new_numbers
END


=end

#Original
def skip_number(numbers)
index_count = 0
new_numbers = []
numbers_length = numbers.length - 1
loop do
new_numbers << numbers[index_count]
index_count += 2
break if index_count >= numbers_length
end
p new_numbers
end

# Improve
def skip_number(numbers)
  index_count = 0
  new_numbers = []
  until index_count >= numbers.length
    new_numbers << numbers[index_count]
    index_count += 2
  end
  p new_numbers
end

old_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
skip_number(old_numbers)