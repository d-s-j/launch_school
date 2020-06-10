def reverse_words(str)
  str.split.map! do |word| 
  word.size >= 5 ? word.reverse : word
  end.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')