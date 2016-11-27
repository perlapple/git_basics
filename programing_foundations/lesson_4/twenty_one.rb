
VALUES = {
  'A' => [ 1, 11 ],
  'J' => [10],
  'Q' => [10],
  'K' => [10]
}

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    if value == "ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "ace" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def shuffle_deck
  ranks = %w{ace 2 3 4 5 6 7 8 9 10 jack queen king}
  suits = %w{spades hearts diamonds clubs}

  ranks.product(suits)
end

def deal_card(deck)
  deck.delete_at(rand(deck.length - 1 ))
end

def print_player(player)
  print "You have: "
  puts player.map { |card| card[0] }.join(', ')
end

def print_dealer(dealer)
  print "Dealer has: "
  puts dealer[1, dealer.length].map { |card| card[0] }.join(', ') + " and unknown card"
end

def hit_or_stay?
  player_turn = nil
  loop do
    puts "Would you like to (h)it or (s)tay?"
    player_turn = gets.chomp.downcase
    break if ['h', 's'].include?(player_turn)
    puts 'Sorry, must enter h or s.'
  end
  player_turn
end

def busted?(player_cards)
  total(player_cards) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    puts "You busted! Dealer wins!"
  elsif dealer_total > 21
    puts "Dealer busted! You win!"
  elsif dealer_total < player_total
    puts "You win!"
  elsif dealer_total > player_total
    puts "Dealer wins!"
  else
    puts "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  puts "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end


loop do
  player_cards  = []
  dealer_cards  = []
  deck = shuffle_deck

  puts "Welcome to 21!"

  player_cards << deal_card(deck) << deal_card(deck)
  dealer_cards << deal_card(deck) << deal_card(deck)

  print_player(player_cards)
  print_dealer(dealer_cards)

  # player turn
  loop do
    player_turn = hit_or_stay?

    if player_turn == 'h'
      player_cards << deal_card(deck)
      puts "You chose to hit!"
      puts "Your cards are now: #{player_cards}"
      puts "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
      display_result(dealer_cards, player_cards)
      play_again? ? next : break
    else
      puts "You stayed at #{total(player_cards)}"
    end

    # dealer turn
    puts "Dealer turn..."

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= 17

      puts "Dealer hits!"
      dealer_cards << deck.pop
      puts "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_cards)
      puts "Dealer total is now: #{total(dealer_cards)}"
      display_result(dealer_cards, player_cards)
      play_again? ? next : break
    else
      puts "Dealer stays at #{total(dealer_cards)}"
    end

    # both player and dealer stays - compare cards!
    puts "=============="
    puts "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    puts "Player has #{player_cards}, for a total of: #{total(player_cards)}"
    puts "=============="

    display_result(dealer_cards, player_cards)

    break unless play_again?
end
