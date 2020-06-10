=begin
  input: a sentence
  -return same sentence, but with numbers converted to digits (ex. 'one' => '1')
=end

DIGITS = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(sentence)
  DIGITS.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/, DIGITS[word])
  end
  sentence
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'