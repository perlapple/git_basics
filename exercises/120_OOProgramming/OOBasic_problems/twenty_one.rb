
class Participant
  attr_accessor :cards, :total

  def initialize
    @cards = []
    @total = 0
  end

  def hit(deck)
    self.cards << deck.pop
  end

  def stay
  end

  def busted?
    total > 21
  end

  def total
    sum = 0

    values = self.cards.map { |card| card.rank }
    values.each do |value|
      if value == "A"
        sum += 11
      elsif value.to_i == 0 # J, Q, K
        sum += 10
      else
        sum += value.to_i
      end
    end

    # correct for Aces
    values.select { |value| value == "A" }.count.times do
      sum -= 10 if sum > 21
    end

    sum
  end

  def print_cards
    self.cards.map(&:rank).join(', ')
  end

end

class Player < Participant
  attr_reader :choice

  def ask_hit_or_stay
    loop do
      puts "Would you like to (h)it or (s)tay?"
      @choice = gets.chomp.downcase
      break if ['h', 's'].include?(choice)
      puts "Sorry, must enter 'h' or 's'."
    end
  end
end

class Dealer < Participant
end


class Deck
  SUITS = ['H', 'D', 'S', 'C'].freeze
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

  attr_reader :cards

  def initialize
    @cards = []
  end

  def shuffle
    SUITS.each { |suit|
      RANKS.each {|rank|
        @cards << Card.new(suit, rank)
      }
    }

    @cards.shuffle!
  end

  def deal
    # does the dealer or the deck deal?
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
end


class Game

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
  end

  def show_initial_cards
    puts "Dealer has: #{@dealer.cards.first.rank} and unknown card"
    puts "You have: #{@player.cards.first.rank} and #{@player.cards[1].rank}"
  end

  def player_turn
     loop do
       @player.ask_hit_or_stay

       if @player.choice == 'h'
       @player.hit(@deck)                          ################################# @player.cards << deck.pop
         puts "You chose to hit!"
         puts "Your cards are now: #{@player.print_cards}"
         puts "Your cards are now: #{@player.total}"
       end

       break if @player.choice == 's' || @player.busted?
    end
  end

  def dealer_turn
    loop do
      break if @dealer.total >= 17

      puts "\n Dealer hits!"
      @dealer.hit(@deck) #@dealer.cards << deck.pop
      puts "Dealer's cards are now: #{@dealer.print_cards}"
    end

    if @dealer.busted?
      puts "Dealer total is now: #{@dealer.total}"
    else
      puts "Dealer stays at #{@dealer.total}"
    end
  end

  def show_result
    result = detect_result

    case result
    when :player_busted
      puts "You busted! Dealer wins!"
    when :dealer_busted
      puts "Dealer busted! You win!"
    when :player
      puts "You win!"
    when :dealer
      puts "Dealer wins!"
    when :tie
      puts "It's a tie!"
    end
  end

  def detect_result
    if @player.total > 21
      :player_busted
    elsif @dealer.total > 21
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
