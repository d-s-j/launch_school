class Player
  attr_reader :number_of_guesses, :guess

  def initialize
    @number_of_guesses = GuessingGame::MAX_GUESSES
  end

  def choose_number
    range = GuessingGame::RANGE.to_a
    puts "Enter a number between #{range.first} and #{range.last}:"
    @guess = gets.to_i
  end

  def subtract_guess
    @number_of_guesses -= 1
  end

  def reset_guesses
    @number_of_guesses = GuessingGame::MAX_GUESSES
  end
end

class GuessingGame
  MAX_GUESSES = 7
  RANGE = (1..100)

  def initialize
    @player = Player.new
    @random_number = choose_random_number
  end

  def choose_random_number
    RANGE.to_a.sample
  end

  def display_guesses_remaining
    if @player.number_of_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@player.number_of_guesses} guesses remaining."
    end
  end

  def invalid?
   !RANGE.cover?(@player.guess)
  end

  def match?
    @player.guess == @random_number
  end

  def too_high?
    @player.guess > @random_number
  end

  def too_low?
    @player.guess < @random_number
  end

  def lost?
   @player.number_of_guesses == 0
  end

  def round_result
    case
    when invalid?
      puts "Invalid guess."
    when too_high?
      puts "Your guess is too high."
      @player.subtract_guess
    when too_low?
      puts "Your guess is too low."
      @player.subtract_guess
    when match?
      puts "That's the number!"
    end
  end

  def game_result
    match? ? puts("You won!") : puts("You have no more guesses. You lost!")
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again?"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid answer."
    end
    answer == 'y'
  end

  def reset
    @player.reset_guesses
    @random_number = choose_random_number
  end

  def play
    loop do
      loop do
        display_guesses_remaining
        @player.choose_number
        round_result
        break if lost? || match?
      end

      game_result
      break unless play_again?
      reset
    end
  end
end

game = GuessingGame.new
game.play