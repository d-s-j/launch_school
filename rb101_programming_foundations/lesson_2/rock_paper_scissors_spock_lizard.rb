VALID_CHOICE = %w(r p s l S)

WIN = {
  'r': ['s', 'l'],
  'p': ['r', 'S'],
  's': ['p', 'l'],
  'l': ['p', 'S'],
  'S': ['s', 'r']
}

convert_choice = {
  'r': 'rock',
  'p': 'paper',
  's': 'scissors',
  'l': 'lizard',
  'S': 'Spock'
}

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if player == computer
    prompt("It's a tie!")
  elsif WIN[:"#{player}"].include?(computer)
    prompt("You've won this round!")
  else
    prompt("The Computer won this round!")
  end
end

player_score = 0
computer_score = 0

prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")
prompt("------------------------------------------------")
prompt("First to 5 wins! Good luck!")

loop do
  player_choice = ''
  loop do
    prompt("Choose one: rock(r), paper(p), scissors(s), lizard(l), Spock(S)")
    player_choice = gets.chomp

    if VALID_CHOICE.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICE.sample

  prompt("You chose: #{convert_choice[:"#{player_choice}"]}; Computer chose: #{convert_choice[:"#{computer_choice}"]}!")

  display_results(player_choice, computer_choice)

  player_score += 1 if WIN[:"#{player_choice}"].include?(computer_choice)
  computer_score += 1 if WIN[:"#{computer_choice}"].include?(player_choice)
  prompt("Your score: #{player_score}; Computer's score: #{computer_score}")

  if player_score == 5
    prompt("Congratulations, you win!")
    player_score = 0 && computer_score = 0
    prompt("Do you want to play again?(y/n)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  elsif computer_score == 5
    prompt("You've lost to the Computer!")
    player_score = 0 && computer_score = 0
    prompt("Do you want to play again?(y/n)")
    answer = Kernel.gets().chomp()
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing Rock, Paper, Spock, Lizard! Goodbye.")