class Player
  attr_reader :number_of_guesses, :guess

  def initialize(max_guesses)
    @number_of_guesses = reset_guesses(max_guesses)
  end

  def choose_number(range)
    puts "Enter a number between #{range.first} and #{range.last}:"
    @guess = gets.to_i
  end

  def subtract_guess
    @number_of_guesses -= 1
  end

  def reset_guesses(max_guesses)
    @number_of_guesses = max_guesses
  end
end

class GuessingGame
  def initialize(range_first, range_last)
    @range = (range_first..range_last)
    @random_number = choose_random_number
    @max_guesses = calculate_max_guesses
    @player = Player.new(@max_guesses)
  end

  def play
    loop do
      loop do
        display_guesses_remaining
        @player.choose_number(@range)
        round_result
        break if lost? || match?
      end
      
      game_result
      break unless play_again?
      reset
    end
  end

  private

  def calculate_max_guesses
    size_of_range = @range.last - @range.first
    Math.log2(size_of_range).to_i + 1
  end

  def choose_random_number
    @range.to_a.sample
  end

  def display_guesses_remaining
    if @player.number_of_guesses == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@player.number_of_guesses} guesses remaining."
    end
  end

  def invalid?
   !@range.cover?(@player.guess)
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
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Invalid answer."
    end
    answer == 'y'
  end

  def reset
    @player.reset_guesses(@max_guesses)
    @random_number = choose_random_number
  end
end

game = GuessingGame.new(501, 1500)
game.play