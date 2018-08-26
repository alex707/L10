# description of the card
class Card
  attr_reader :suit, :value, :cost

  def initialize(suit, value, cost)
    @suit = suit
    @value = value
    @cost = cost
  end

  def card
    (@value.to_s + @suit.to_s).ljust(5, ' ') + @cost.to_s
  end
end
