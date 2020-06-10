class Anagram
  attr_reader :original_word

  def initialize(word)
    @original_word = word
  end

  def match(words)
    words.select do |word|
      count_chr(word) == count_chr(original_word) &&
      word.downcase != original_word.downcase
    end
  end

  def count_chr(str)
    characters = str.downcase.chars
    characters.each_with_object(Hash.new(0)) do |chr, count|
      count[chr] += 1
    end
  end
end
