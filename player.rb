# description of the player
class Player
  attr_accessor :bank

  attr_reader :name, :cards

  def initialize(name, bank = 100)
    @name = name
    @bank = bank
  end

  def add_card card
    @cards << card
  end
end
