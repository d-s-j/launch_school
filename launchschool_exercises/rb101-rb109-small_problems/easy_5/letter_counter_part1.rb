def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hash|
    hash[word.size] += 1
  end
end