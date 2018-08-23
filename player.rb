# description of the player
class Player
  attr_accessor :cash

  attr_reader :name, :cards, :bet

  def initialize(name, cash = 100)
    @name = name
    @cash = cash
    @cards = []
    @bet = 0
  end

  def add_card(card)
    @cards << card
  end

  def score
    score = 0
    @cards.each do |c|
      score += c.cost == 11 && score + c.cost > 21 ? 1 : c.cost
    end
    score
  end

  def face_value
    @cards.map { |c| c.value.to_s + c.suit.to_s }
  end

  def fold
    @cards.clear
    @bet = 0
  end

  def make_bet(bet = 10)
    @cash -= bet
    @bet += 10
  end
end
