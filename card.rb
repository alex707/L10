# description of the card
class Card
  attr_reader :suit, :value, :cost, :addition

  @@deck = []

  def initialize(suit, value, cost, addition = nil)
    @suit = suit
    @value = value
    @cost = cost
    @addition = addition
  end

  def self.get_card
    @@deck.shift
  end

  def self.fill_deck
    ['♠', '♣', '♥', '♦'].product(
      ['2', '3', '4', '5',
      '6', '7', '8', '9',
      '10', 'J', 'Q', 'K', 'A']
    ).each do |s, v|
      c = v.to_i.zero? ? 10 : v.to_i
      @@deck << if v.to_s == 'A'
                  Card.new(s, v, c, 1)
                else
                  Card.new(s, v, c)
                end
    end

    @@deck.shuffle!
  end

  def self.deck
    @@deck
  end

  def card
    (@value.to_s + @suit.to_s).ljust(5, ' ') +
    @cost.to_s + "#{'/'+@addition.to_s if @addition}"
  end
end
