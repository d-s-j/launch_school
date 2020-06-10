class Card
  include Comparable
  attr_reader :rank, :suit

  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    RANK_VALUES.fetch(rank, rank)
  end

  def suit_value
    SUIT_VALUES.fetch(suit)
  end

  def <=>(other_card)
    if (rank_value <=> other_card.rank_value) == 0
      suit_value <=> other_card.suit_value
    else
      rank_value <=> other_card.rank_value
    end
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    @deck = []
    reset
  end

  def reset
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end

    deck.shuffle!
  end

  def draw
    reset if deck.empty?
    deck.pop
  end

  def to_s
    deck.each { |card| puts card }
  end
end

deck = Deck.new

drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2