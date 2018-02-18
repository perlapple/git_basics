# participant class
class Participant
  attr_reader :cards, :total

  def initialize
    @cards = []
    @total = 0
  end

  def name
    raise NotImplemented
  end

  def hit(deck)
    take_card(deck)
    calculate_total

    puts "#{name} choses to hit!"
    puts "#{name}'s cards are now: #{print_cards}"
    puts "#{name}'s total is now: #{total}"
  end

  def take_card(deck)
    cards << deck.pop
  end

  def busted?
    total > 21
  end

  def calculate_total
    hand_total = cards.map(&:numerical_value).sum

    # correct for Aces
    cards.map(&:rank).select { |value| value == 'A' }.count.times do
      hand_total -= 10 if hand_total > 21
    end

    @total = hand_total
  end

  def print_cards
    cards.map(&:rank).join(', ')
  end
end

# Player class
class Player < Participant
  attr_reader :choice

  def ask_hit_or_stay
    loop do
      puts 'Would you like to (h)it or (s)tay?'
      @choice = gets.chomp.downcase
      break if %w[h s].include?(choice)
      puts 'Sorry, must enter \'h\' or \'s\'.'
    end
  end

  def name
    'Player'
  end
end

# Dealer class
class Dealer < Participant
  def name
    'Dealer'
  end
end

# Deck class
class Deck
  SUITS = %w[H D S C].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :cards

  def initialize
    @cards = []
  end

  def shuffle
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end

    @cards.shuffle!
  end

  def deal
    # does the dealer or the deck deal?
  end
end

# Card class
class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def numerical_value
    if rank == 'A'
      11
    elsif rank.to_i.zero? # J, Q, K
      10
    else
      rank.to_i
    end
  end
end

# Game class
class Game
  RESULTS_TEXT = {
    player_busted: 'You busted! Dealer wins!',
    dealer_busted: 'Dealer busted! You win!',
    player: 'You win!',
    dealer: 'Dealer wins!',
    tie: 'It\'s a tie!',
    both_busted: "Both lost, it\'s a tie"
  }.freeze

  def initialize
    @deck = Deck.new.shuffle
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  def deal_cards
    2.times do
      @player.cards << @deck.pop
      @dealer.cards << @deck.pop
    end

    @dealer.calculate_total
    @player.calculate_total
  end

  def show_initial_cards
    puts "Dealer has: #{@dealer.cards.first.rank} and unknown card"
    puts "You have: #{@player.cards.first.rank} and #{@player.cards[1].rank}"
  end

  def player_turn
    loop do
      @player.ask_hit_or_stay
      @player.hit(@deck) if @player.choice == 'h'

      break if @player.choice == 's' || @player.busted?
    end
  end

  def dealer_turn
    loop do
      break if @dealer.total >= 17

      @dealer.hit(@deck)
    end

    if @dealer.busted?
      puts "Dealer total is now: #{@dealer.total}"
    else
      puts "Dealer stays at #{@dealer.total}"
    end
  end

  def show_result
    puts RESULTS_TEXT[result]
  end

  def result
    if @dealer.busted? && @player.busted?
      :both_busted
    elsif @player.busted?
      :player_busted
    elsif @dealer.busted?
      :dealer_busted
    elsif @dealer.total < @player.total
      :player
    elsif @dealer.total > @player.total
      :dealer
    else
      :tie
    end
  end
end

Game.new.start
