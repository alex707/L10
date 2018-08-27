load './card.rb'
load './deck.rb'
load './player.rb'
load './view.rb'
load './game.rb'

playing = true

print 'Enter you name: '
name = gets.chomp

dealer = Player.new('Dealer')
player = Player.new(name)

while playing
  deck = Deck.new

  game = Game.new(player, dealer, deck)
  view = View.new(game)

  puts view.start_game

  loop do
    game.deal_cards
    puts view.bank

    puts view.show_cards
    puts view.check_action

    choise = gets.to_i
    break if choise == 2
    if choise == 3
      player.add_card(deck.take_card)
      puts view.show_cards(false, 'Youre recived a card.')
      gets
    end

    dealer.add_card deck.take_card if dealer.score < 17

    puts view.show_cards(false, 'Dealer made a choice')
    puts view.check_action(player.cards.size > 2)

    choise = gets.to_i
    if choise == 3
      player.add_card(deck.take_card)
      puts view.show_cards(false, 'Youre recived a card.')
    end

    break
  end

  puts view.show_cards(true)

  puts view.congrats(game.define_winner)

  puts view.end_game
  playing = false if gets.to_i != 1
end

puts 'See you later.'
