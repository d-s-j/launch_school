# RB101 Programming Foundations > Lesson 3: Practice Problems > Hard 1
# Question 4: You're not returning a false condition, and you're not handling 
# the case that there are more or fewer than 4 components to the IP address 
# (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if is_an_ip_number?(word)
  end
  
  true
end