class Scrabble
  SCORES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word.nil? ? '' : word.upcase
  end

  def score
    total = 0
    @word.each_char do |letter|
      SCORES.each_key do |letters|
        if letters.include?(letter)
          total += SCORES[letters]
          break
        end
      end
    end

    total
  end

  def self.score(word)
    new(word).score
  end
end
