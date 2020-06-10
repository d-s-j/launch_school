def ascii_value(word)
  word.chars.map(&:ord).sum
end