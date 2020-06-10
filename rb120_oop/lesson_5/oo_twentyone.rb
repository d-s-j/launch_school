module Hand
  def show_hand
    puts "#{name}'s Hand".center(20, '-')
    cards.each do |card|
      puts "> #{card}"
    end
  end

  def total
    total = 0

    cards.each do |card|
      total += if card.face == 'Ace'
                 11
               elsif card.face.to_i == 0
                 10
               else
                 card.face.to_i
               end
    end

    cards.each do |card|
      total -= 10 if card.face == 'Ace' && total > 21
    end

    total
  end

  def bust?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def hit(deck)
    puts "#{name} chose to hit!"
    card = deck.deal
    puts "#{name} has drawn #{card}."
    cards << card
  end
end

class Player < Participant
  attr_reader :name

  def choose_name
    loop do
      puts "What is your name?"
      @name = gets.chomp
      break if !@name.empty?
      puts "Invalid name."
    end
  end
end

class Dealer < Participant
  attr_reader :name

  def initialize
    @name = "Dealer"
    super
  end

  def show_flop
    puts "#{name}'s Hand".center(20, '-')
    puts "> #{cards.first}"
    puts "> Unknown card"
  end
end

class Card
  FACES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  SUITS = %w(Hearts Diamonds Spades Clubs)

  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def to_s
    "The #{face} of #{suit}"
  end
end

class Deck
  def initialize
    @cards = []
    Card::FACES.each do |face|
      Card::SUITS.each do |suit|
        @cards << Card.new(face, suit)
      end
    end

    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end

class TwentyOne
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    2.times do
      player.cards << deck.deal
      dealer.cards << deck.deal
    end
  end

  def show_flop
    player.show_hand
    dealer.show_flop
  end

  def player_turn
    answer = nil
    loop do
      puts "Your total: #{player.total}"
      puts "Do you want to (h)it or (s)tay?"
      answer = gets.chomp

      if answer == 's'
        puts 'You chose to stay.'
        break
      elsif answer == 'h'
        player.hit(deck)
      else
        puts "Invalid choice."
      end

      if player.bust?
        puts "#{player.name}'s total: #{player.total}"
        puts "You bust!"
        break
      end
    end
  end

  def dealer_turn
    loop do
      puts "#{dealer.name}'s total: #{dealer.total}"

      if dealer.total >= 17
        puts "Dealer chose to stay."
        break
      else
        dealer.hit(deck)
      end

      if dealer.bust?
        puts "#{dealer.name}'s total: #{dealer.total}"
        puts "Dealer busts!"
        break
      end
    end
  end

  def display_results
    player.show_hand
    puts "#{player.name}'s total: #{player.total}"
    dealer.show_hand
    puts "#{dealer.name}'s total: #{dealer.total}"

    if player.total > dealer.total
      puts "#{player.name} wins!"
    elsif dealer.total > player.total
      puts "#{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
    end

    answer == 'y'
  end

  def reset
    player.cards = []
    dealer.cards = []
  end

  def clear
    system 'clear'
  end

  def start
    clear
    player.choose_name

    loop do
      clear
      puts "Welcome to Twenty-One!"

      loop do
        deal_cards
        show_flop

        player_turn
        if player.bust?
          puts "#{dealer.name} wins!"
          break
        end

        dealer_turn
        if dealer.bust?
          puts "#{player.name} wins!"
          break
        end

        display_results
        break
      end

      play_again? ? reset : break
    end

    puts "Thanks for playing Twenty-One!"
  end
end

game = TwentyOne.new
game.start
