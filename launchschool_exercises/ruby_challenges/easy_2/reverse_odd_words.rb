=begin
  input: string
    - 1 or more words
    - word: 1 - 20 chararters
    - words separated by 1 or more " " and followed by 0 or more " "
    - string ending with "."
  output: string
    - odd words reversed
    - even words remain the same
  add.notes: 
    zero-based index (EVEN: 0, 2, 4 etc.) (ODD: 1, 3, 5 etc.)

  bonus: The characters must be read and printed one at a time.

  algorithm:
    initialize array = input_string.split by each word
    iterate/transform through arr by index |word, index|
      if index odd then reverse word
      if index even then return word
    iterate END
    join elements in new_array with " "
    append "." to new_array
=end

def reverse_odd_words(str)
  words = str.scan(/\b[\w']+\b/)
  words.map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end.join(' ') + '.'
end

p reverse_odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p reverse_odd_words("what's the matter with Kansas.") == "what's eht matter htiw Kansas."
p reverse_odd_words("what   is the matter with kansas .") == "what si the rettam with sasnak."
p reverse_odd_words(".") == "."
