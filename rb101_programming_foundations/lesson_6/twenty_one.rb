def prompt(msg)
  puts "=> #{msg}"
end

def spacer(label)
  puts ''
  puts label.center(25, '-')
  puts ''
end

# rubocop:disable Metrics/LineLength
def intialize_deck
  [['Spades', ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']],
   ['Hearts', ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']],
   ['Clubs', ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']],
   ['Diamonds', ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']]]
end
# rubocop:enable Metrics/LineLength

def deal_card(cards, user)
  user << [cards.shuffle![0][0], cards[0][1].shuffle!.pop]
end

def total_value(cards)
  values = cards.map { |card| card[1] }

  total = 0
  values.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end

    total -= 10 if value == 'Ace' && total > 21
  end

  total
end

def bust?(cards)
  total_value(cards) > 21
end

def display_player_cards(cards)
  prompt "You have: #{cards}, total: #{total_value(cards)}"
end

def display_dealer_cards(cards)
  prompt "Dealer has: #{cards}, total: #{total_value(cards)}"
end

def display_results(result)
  case result
  when :player_bust
    prompt "Player busts!"
    prompt "Dealer wins!"
  when :dealer_bust
    prompt "Dealer busts!"
    prompt "Player wins!"
  when :player_wins
    prompt "Player wins!"
  when :dealer_wins
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_score(player, dealer)
  prompt "Player Score: #{player}"
  prompt "Dealer Score: #{dealer}"
end

def detect_results(player, dealer)
  player_total = total_value(player)
  dealer_total = total_value(dealer)

  if bust?(player)
    :player_bust
  elsif bust?(dealer)
    :dealer_bust
  elsif player_total > dealer_total
    :player_wins
  elsif dealer_total > player_total
    :dealer_wins
  else
    :tie
  end
end

# GAME
loop do
  dealer_score = 0
  player_score = 0

  loop do
    system 'cls'
    spacer('TWENTY-ONE')

    display_score(player_score, dealer_score)

    spacer('')

    deck = intialize_deck
    dealer_cards = []
    player_cards = []

    2.times do
      deal_card(deck, dealer_cards)
      deal_card(deck, player_cards)
    end

    prompt "Dealer has: #{dealer_cards[0]} and a unknown card"
    display_player_cards(player_cards)

    # PLAYERS TURN
    spacer('PLAYER')

    loop do
      answer = ''
      loop do
        prompt "Do you want to (h)it or (s)tay?"
        answer = gets.chomp
        break if answer == 's' || answer == 'h'
      end
      break if answer == 's'

      deal_card(deck, player_cards)
      display_player_cards(player_cards)

      break if bust?(player_cards)
    end

    # DEALERS TURN
    spacer('DEALER')

    loop do
      break if bust?(player_cards)

      if total_value(dealer_cards) >= 17
        prompt "Dealer chose to stay."
        break
      else
        prompt "Dealer chose to hit!"
        prompt "Dealer recieved a #{deal_card(deck, dealer_cards).last}"
      end

      break if bust?(dealer_cards)
    end

    spacer('RESULT')

    display_player_cards(player_cards)
    display_dealer_cards(dealer_cards)

    puts ""
    display_results(detect_results(player_cards, dealer_cards))

    case detect_results(player_cards, dealer_cards)
    when :player_bust
      dealer_score += 1
    when :dealer_wins
      dealer_score += 1
    when :dealer_bust
      player_score += 1
    when :player_wins
      player_score += 1
    end

    spacer('')
    prompt "Press any key to continue."
    gets

    if player_score == 5
      system 'cls'
      spacer('WINNER')
      puts "PLAYER!".center(25)
      break
    elsif dealer_score == 5
      system 'cls'
      spacer('WINNER')
      puts "DEALER!".center(25)
      break
    end
  end

  spacer('')
  answer = ''
  loop do
    prompt "Play again (y/n)?"
    answer = gets.chomp
    break if answer == 'y' || answer == 'n'
  end
  break if answer == 'n'
end

system 'cls'
spacer('')
prompt "Thanks for playing Twenty-One!"
spacer('')
