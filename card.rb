# description of the card
class Card
  attr_reader :suit, :value, :cost

  @@deck = [] # rubocop:disable Style/ClassVars

  def initialize(suit, value, cost)
    @suit = suit
    @value = value
    @cost = cost
  end

  def self.take_card
    @@deck.shift
  end

  def self.fill_deck
    ['♠', '♣', '♥', '♦'].product(%w[2 3 4 5 6 7 8 9 10 J Q K A]).each do |s, v|
      c = if v.to_s == 'A'
            11
          else
            v.to_i.zero? ? 10 : v.to_i
          end
      @@deck << Card.new(s, v, c)
    end
    @@deck.shuffle!
  end

  def self.deck
    @@deck
  end

  def card
    (@value.to_s + @suit.to_s).ljust(5, ' ') + @cost.to_s
  end
end
