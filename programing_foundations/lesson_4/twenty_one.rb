
WHATEVER = 21

VALUES = {
  'A' => [1, 11],
  'J' => [10],
  'Q' => [10],
  'K' => [10]
}.freeze

def value_ten?(value)
  value.to_i.zero? # J, Q, K
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum += case value
           when 'ace'
             11
           when 'jack', 'queen', 'king'
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value == 'ace' }.count.times do
    sum -= 10 if sum > WHATEVER
  end

  sum
end

def shuffle_deck
  ranks = %w(ace 2 3 4 5 6 7 8 9 10 jack queen king)
  suits = %w(spades hearts diamonds clubs)

  ranks.product(suits)
end

def deal_card(deck)
  deck.delete_at(rand(deck.length - 1))
end

def print_player(player)
  print 'You have: '
  puts player.map { |card| card[0] }.join(', ')
end

def print_dealer(dealer)
  print 'Dealer has: '
  puts dealer[1, dealer.length].map { |card| card[0] }.join(', ') + ' and unknown card'
end

def hit_or_stay?
  player_turn = nil
  loop do
    puts 'Would you like to (h)it or (s)tay?'
    player_turn = gets.chomp.downcase
    break if %w(h s)  .include?(player_turn)
    puts 'Sorry, must enter h or s.'
  end
  player_turn
end

def busted?(player_cards)
  total(player_cards) > WHATEVER
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WHATEVER
    :player_busted
  elsif dealer_total > WHATEVER
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def play_again?
  puts '-------------'
  puts 'Do you want to play again? (y or n)'
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def reset_score
  @score = {
    'player' => 0,
    'dealer' => 0
  }
end

def match_winner
  @score.key(5)
end

def calculate_score(winner)
  @score[winner] += 1
end

def display_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WHATEVER
    calculate_score('dealer')
    puts 'You busted! Dealer wins!'
  elsif dealer_total > WHATEVER
    calculate_score('player')
    puts 'Dealer busted! You win!'
  elsif dealer_total < player_total
    calculate_score('player')
    puts 'You win!'
  elsif dealer_total > player_total
    calculate_score('dealer')
    puts 'Dealer wins!'
  else
    puts 'It\'s a tie!'
  end
end

def compare_cards(player_cards, dealer_cards)
  # both player and dealer stays - compare cards!
  puts '=============='
  puts "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  puts "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts '=============='

#  display_result(dealer_cards, player_cards)

end


reset_score
loop do
  loop do
    player_cards  = []
    dealer_cards  = []
    deck = shuffle_deck

    puts '###############################################################'
    puts 'Welcome to Whatever-One!'

    player_cards << deal_card(deck) << deal_card(deck)
    dealer_cards << deal_card(deck) << deal_card(deck)

    print_player(player_cards)
    print_dealer(dealer_cards)

    # player turn
    loop do
      player_turn = hit_or_stay?

      if player_turn == 'h'
        player_cards << deal_card(deck)
        puts 'You chose to hit!'
        puts "Your cards are now: #{player_cards}"
        puts "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      display_result(dealer_cards, player_cards)
#      compare_cards(dealer_cards, player_cards)
#      play_again? ? next : break
       break
    else
      puts "You stayed at #{total(player_cards)}"
    end

    # dealer turn
    puts 'Dealer turn...'

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= 17

      puts 'Dealer hits!'
      dealer_cards << deck.pop
      puts "Dealer's cards are now: #{dealer_cards}"
    end

    dealer_total = total(dealer_cards)

    if busted?(dealer_cards)
      puts "Dealer total is now: #{dealer_total}"
      display_result(dealer_cards, player_cards)
      break
#      play_again? ? next : break
    else
      puts "Dealer stays at #{dealer_total}"
    end

    # both player and dealer stays - compare cards!
    puts '=============='
    puts "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    puts "Player has #{player_cards}, for a total of: #{total(player_cards)}"
    puts '=============='

    display_result(dealer_cards, player_cards)

  end

  if match_winner
    puts "Score: #{@score}... The winner of 5 games is: #{match_winner}"
    break
  end

#  play_again? ? next : break
end
