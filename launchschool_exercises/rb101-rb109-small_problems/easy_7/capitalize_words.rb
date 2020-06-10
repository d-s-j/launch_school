def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end