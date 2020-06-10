# RB101 Programming Foundations > Lesson 3: Practice Problems > Medium 1
# Question 4: Is there a difference between the two, 
# other than what operator she chose to use to add an element to the buffer?

# Mutates caller
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Does not mutate caller
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end