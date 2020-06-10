hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog'] 
}

hsh.each do |_,v|
  v.each do |word|
    puts word.delete "^aeiou"
  end
end

# or

vowels = 'aeiou'
hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end