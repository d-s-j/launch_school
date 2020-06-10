# oo_rock_paper_scissors.rb

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (rock? && other_move.lizard?) ||
      (paper? && other_move.rock?) ||
      (paper? && other_move.spock?) ||
      (scissors? && other_move.paper?) ||
      (scissors? && other_move.lizard?) || 
      (spock? && other_move.rock?) ||
      (spock? && other_move.scissors?) ||
      (lizard? && other_move.paper?) ||
      (lizard? && other_move.spock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (rock? && other_move.spock?) ||
      (paper? && other_move.scissors?) ||
      (paper? && other_move.lizard?) ||
      (scissors? && other_move.rock?) ||
      (scissors? && other_move.spock?) || 
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (lizard? && other_move.rock?) ||
      (lizard? && other_move.scissors?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @score = 0
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chappie', 'Sony', 'BOT Joe'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_winner
    if human.score == 10
      puts "#{human.name} won!"
    else
      puts "#{computer.name} won!"
    end
  end

  def display_score
    puts "#{human.name}: #{human.score} #{computer.name}: #{computer.score}"
  end

  def add_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end
  
  def winner?
    human.score == 10 || computer.score == 10
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    loop do
      display_welcome_message
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        add_score
        display_score
        break if winner?
      end
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
