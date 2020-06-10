class PigLatin
  def self.translate(str)
    str.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    # starts with a vowel or starts with 'x' or 'y' followed by vowel?
    if word.start_with?(/[aeiou]|[xy][^aeiou]/)
      word + 'ay'
    else
      # String#partition returns part before match, the match, and part after.
      # #partition by zero or one consonant followed by 'qu' or one or more consonants.
      sep_word = word.partition(/[^aeiou]?qu|[^aeiou]+/)
      sep_word[-1] + sep_word[1] + 'ay'
    end
  end
end