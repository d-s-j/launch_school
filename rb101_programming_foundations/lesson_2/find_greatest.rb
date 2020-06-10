# RB101 Programming Foundations > Lessons 2 > Translating Pseudo-Code to Program Code

=begin
START
# Given a collection of integers called "numbers"
SET iterator = 1
SET saved_number = value within numbers collection at space 1
WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number
  iterator = iterator + 1
PRINT saved_number
END
=end

# Original
def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num  # assign to first value
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

# Improve
def find_greatest(numbers)
  return if numbers.nil?
  saved_number = numbers.first
  numbers.each do |num|
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end