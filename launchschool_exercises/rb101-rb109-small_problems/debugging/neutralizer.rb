=begin
  We wrote a neutralize method that removes negative words from sentences. 
  However, it fails to remove all of them. What exactly happens?
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end


puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Solution:
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) } # iterates by index, therefore skipping elements in array when deleted
  words.join(' ')
end