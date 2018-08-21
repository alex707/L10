load './card.rb'
load './player.rb'

Card.fill_deck

puts Card.deck.map(&:card)
