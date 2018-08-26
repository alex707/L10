# deck contain cards
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    ['♠', '♣', '♥', '♦'].product(%w[2 3 4 5 6 7 8 9 10 J Q K A]).each do |s, v|
      c = if v.to_s == 'A'
            11
          else
            v.to_i.zero? ? 10 : v.to_i
          end
      @cards << Card.new(s, v, c)
    end
    @cards.shuffle!
  end

  def take_card
    @cards.shift
  end
end
