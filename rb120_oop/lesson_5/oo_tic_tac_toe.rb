module TicTacToe
  class Board
    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                    [[1, 5, 9], [3, 5, 7]]              # diagonals

    attr_accessor :squares

    def initialize
      @squares = {}
      reset
    end

    def []=(num, marker)
      @squares[num].marker = marker
    end

    def unmarked_keys
      @squares.keys.select { |key| @squares[key].unmarked? }
    end

    def full?
      unmarked_keys.empty?
    end

    def someone_won_round?
      !!winning_marker
    end

    def winning_marker
      WINNING_LINES.each do |line|
        squares = @squares.values_at(*line)
        if three_identical_markers?(squares)
          return squares.first.marker
        end
      end
      nil
    end

    def reset
      (1..9).each { |num| @squares[num] = Square.new }
    end

    def find_winning_square(marker)
      WINNING_LINES.each do |line|
        row = @squares.values_at(*line)
        marker_count = row.select { |sq| sq.marker == marker }.size

        if two_identical_markers?(row) && marker_count == 2
          square = @squares.values_at(*line).select { |sq| sq.marker == ' ' }
          return @squares.key(square.pop)
        end
      end
      nil
    end

    def find_at_risk_square
      WINNING_LINES.each do |line|
        row = @squares.values_at(*line)

        if two_identical_markers?(row)
          square = @squares.values_at(*line).select { |sq| sq.marker == ' ' }
          return @squares.key(square.pop)
        end
      end
      nil
    end

    # rubocop:disable Metrics/AbcSize
    def draw
      puts "     |     |"
      puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
      puts "     |     |"
      puts "-----+-----+-----"
      puts "     |     |"
      puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
      puts "     |     |"
    end
    # rubocop:enable Metrics/AbcSize

    private

    def two_identical_markers?(squares)
      markers = squares.select(&:marked?).collect(&:marker)
      return false if markers.size != 2
      return true if markers.uniq.size == 1
    end

    def three_identical_markers?(squares)
      markers = squares.select(&:marked?).collect(&:marker)
      return false if markers.size != 3
      markers.min == markers.max
    end
  end

  class Square
    INITIAL_MARKER = " "

    attr_accessor :marker

    def initialize(marker=INITIAL_MARKER)
      @marker = marker
    end

    def to_s
      @marker
    end

    def unmarked?
      marker == INITIAL_MARKER
    end

    def marked?
      marker != INITIAL_MARKER
    end
  end

  class Player
    attr_reader :marker
    attr_accessor :score

    def initialize
      @score = 0
    end

    def add_point
      self.score += 1
    end

    def joinor(arr)
      case arr.size
      when 0 then ''
      when 1 then arr.first
      when 2 then arr.join(" or ")
      else
        arr[-1] = "or #{arr.last}"
        arr.join(', ')
      end
    end
  end

  class Human < Player
    attr_reader :name

    def initialize
      @name = choose_name
      @marker = choose_marker
      super
    end

    def choose_marker
      mark = ''
      loop do
        puts "Choose your marker. (1-character long.)"
        mark = gets.chomp
        break if mark.size == 1 && mark != 'O'
        puts "Invalid marker choice."
      end

      mark
    end

    def choose_name
      name = ''
      loop do
        puts "Type in your name."
        name = gets.chomp
        break unless name.strip.empty?
        puts "Invalid name."
      end
      name
    end

    def move(board)
      puts "Choose a square (#{joinor(board.unmarked_keys)}): "
      square = nil

      loop do
        square = gets.chomp.to_i
        break if board.unmarked_keys.include?(square)
        puts "Sorry, that's not a valid choice."
      end

      board[square] = marker
    end
  end

  class Computer < Player
    def initialize
      @marker = 'O'
      super
    end

    def move(board)
      square = board.find_winning_square(marker)
      square = board.find_at_risk_square if !square
      square = board.unmarked_keys.sample if !square

      board[square] = marker
    end
  end

  # Orchestration Engine
  class TTTGame
    attr_reader :board, :human, :computer

    def initialize
      @board = Board.new
      @human = Human.new
      @computer = Computer.new
      @current_marker = human.marker
    end

    def display_welcome_message
      puts "Welcome to Tic Tac Toe!"
      puts ""
    end

    def display_goodbye_message
      puts "Thanks for playing Tic Tac Toe! Goodbye!"
    end

    def display_board
      puts "Tic Tac Toe - First to 5 wins!"
      puts "You are #{human.marker}. Computer is #{computer.marker}."
      puts ""
      board.draw
      puts ""
      puts "#{human.name}'s Score: #{human.score}"
      puts "Computer's Score: #{computer.score}"
    end

    def clear_screen_and_display_board
      clear
      display_board
    end

    def play_again?
      answer = nil
      loop do
        puts "Would you like to play again? (y/n)"
        answer = gets.chomp.downcase
        break if %w(y n).include?(answer)
        puts "Sorry, must be y or n."
      end

      answer == 'y'
    end

    def clear
      system 'cls'
    end

    def reset_round
      board.reset
      @current_marker = human.marker
      clear
    end

    def reset
      clear
      human.score = 0
      computer.score = 0
      display_welcome_message
    end

    def current_player_moves
      if human_turn?
        human.move(board)
        @current_marker = computer.marker
      else
        computer.move(board)
        @current_marker = human.marker
      end
    end

    def human_turn?
      @current_marker == human.marker
    end

    def award_point
      case board.winning_marker
      when human.marker
        human.add_point
      when computer.marker
        computer.add_point
      end
    end

    def display_round_result
      clear_screen_and_display_board

      case board.winning_marker
      when human.marker
        puts "#{human.name} won the round!"
      when computer.marker
        puts "Computer has won the round!"
      else
        puts "It's a tie!"
      end

      press_to_continue
    end

    def display_game_result
      clear

      if human.score == 5
        puts "YOU WIN!"
      elsif computer.score == 5
        puts "COMPUTER WINS!"
      end
    end

    def someone_won_game?
      human.score == 5 || computer.score == 5
    end

    def press_to_continue
      puts "Press any key to continue."
      gets
    end

    def play
      loop do
        reset

        loop do
          display_board

          loop do
            current_player_moves
            award_point && break if board.someone_won_round?
            break if board.full?
            clear_screen_and_display_board if human_turn?
          end

          display_round_result
          reset_round
          break if someone_won_game?
        end

        display_game_result
        break unless play_again?
      end

      display_goodbye_message
    end
  end

  game = TTTGame.new
  game.play
end
