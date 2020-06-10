def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hash|
    word = word.delete('^A-Za-z')
    hash[word.size] += 1
  end
end

# or

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hash|
    hash[word.count('A-Za-z')] += 1
  end
end