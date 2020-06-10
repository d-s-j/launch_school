puts "Please write a word or multiple words:"
word = gets.chomp
character_count = word.delete(' ').size
puts "There are #{character_count} characters in \"#{word}\"."