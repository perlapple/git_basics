
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
    calculate_total(self.cards) > 21
  end

  def calculate_total(cards)
    values = cards.map { |card| card.rank }
   
    values.each do |value|
      if value == "A"
        @total += 11
      elsif value.to_i == 0 # J, Q, K
        @total += 10
      else
        @total += value.to_i
      end
    end

    # correct for Aces
    values.select { |value| value == "A" }.count.times do
      @total -= 10 if @total > 21
    end

    self.total
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
    # show_result
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
       end

       break if @player.choice == 's' || @player.busted?
    end
  end
  
  def dealer_turn
    loop do
      puts "#######################"
      puts  @dealer.total
      break if @dealer.total >= 17

      puts "Dealer hits!"
      @dealer.hit(@deck) #@dealer.cards << deck.pop
      puts "Dealer's cards are now: #{@dealer.print_cards}"
    end

    if @dealer.busted?
      puts "Dealer total is now: #{@dealer.total}"
  #    show_result
    else
      puts "Dealer stays at #{@dealer.total}"
    end
  end
  
  def show_result
    result = detect_result
  
    case result
    when :player_busted
      prompt "You busted! Dealer wins!"
    when :dealer_busted
      prompt "Dealer busted! You win!"
    when :player
      prompt "You win!"
    when :dealer
      prompt "Dealer wins!"
    when :tie
      prompt "It's a tie!"
    end
  end
  
  def detect_result
    puts "@player.total #{@player.total}"
    puts "@dealer.total #{@player.total}"
        
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