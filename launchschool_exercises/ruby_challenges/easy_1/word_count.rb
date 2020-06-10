class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase = @phrase.downcase.scan(/[\w']+/)
    phrase.each { |word| word.gsub!(/'/, '') if word.match(/\A'.+'\z/) }
    phrase.each_with_object(Hash.new(0)) do |word, count|
      count[word] += 1
    end
  end
end