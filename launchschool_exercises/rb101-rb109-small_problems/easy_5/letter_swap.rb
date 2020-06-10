def swap(str)
  str.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end.join(' ')
end