# Class using OOP
class Card
  attr_reader :rank, :suit

  RANKINGS = { 'jack' => 11, 'queen' => 12, 'king' => 13, 'ace' => 14 }.freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    ranking_to_numeric <=> other.ranking_to_numeric
  end

  def ==(other)
    ranking_to_numeric == other.ranking_to_numeric
  end

  def ranking_to_numeric
    if @rank.is_a?(Integer)
      @rank
    else
      RANKINGS[@rank.downcase]
    end
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end

# Deck class for ...
class Deck
  RANKS = (2..10).to_a + %w[Jack Queen King Ace].freeze
  SUITS = %w[Hearts Clubs Diamonds Spades].freeze
  attr_accessor :cards

  def initialize
    reset
  end

  def draw
    card = draw_and_remove
    reset if empty?

    card
  end

  def empty?
    @cards.empty?
  end

  private

  def reset
    @cards = []

    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards.push(Card.new(rank, suit))
      end
    end
  end

  def draw_and_remove
    @cards.delete_at(rand(@cards.length))
  end
end

cards = [Card.new('Ace', 'Hearts'),
         Card.new(2, 'Diamonds'),
         Card.new(10, 'Diamonds')]

puts cards
puts Card.new(2, 'Hearts')
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13
