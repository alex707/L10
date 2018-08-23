load './card.rb'
load './player.rb'

playing = true

print 'Enter you name: '
name = gets.chomp

dealer = Player.new('Dealer')
player = Player.new(name)

while playing
  Card.fill_deck
  # puts Card.deck.map(&:card)

  puts "Your cash: $#{player.cash}"

  puts 'Press any key to start game.'
  gets
  puts 'Game started...'
  puts

  game_bank_d = 0
  game_bank_p = 0

  # rubocop:disable Metrics/BlockLength
  loop do
    dealer.add_card Card.take_card
    dealer.add_card Card.take_card
    player.add_card Card.take_card
    player.add_card Card.take_card

    game_bank_d = dealer.make_bet
    game_bank_p = player.make_bet
    puts
    puts "Bank: $#{game_bank_d + game_bank_p}"

    puts "Dealers cards:  #{Array.new(dealer.face_value.size, '**').join(', ')}"
    puts "Dealers cards:  #{dealer.face_value.join(', ')}"
    puts "Your cards:     #{player.face_value.join(', ')}"
    puts "Your score:     #{player.score}"

    puts
    puts 'Check action:'
    puts '  1 - skip'
    puts '  2 - open cards'
    puts '  3 - give me a card'

    choise1 = gets.to_i
    puts
    case choise1
    when 2
      break
    when 3
      player.add_card Card.take_card
      puts 'Youre recived a card.'
      puts 'Dealers cards:  ' \
        "#{Array.new(dealer.face_value.size, '**').join(', ')}"
      puts "Your cards:     #{player.face_value.join(', ')}"
      puts "Your score:     #{player.score}"
    end

    puts 'Dealers choise..'

    dealer.add_card Card.take_card if dealer.score < 17

    puts 'Dealer made a choice'
    puts

    puts "Dealers cards:  #{Array.new(dealer.face_value.size, '**').join(', ')}"
    puts "Your cards:     #{player.face_value.join(', ')}"
    puts "Your score:     #{player.score}"
    puts

    puts 'Check action:'
    puts '  1 - skip'
    puts '  2 - open cards'
    puts '  3 - give me a card' if player.cards.size < 3

    choise2 = gets.to_i
    case choise2
    when 3
      if player.cards.size < 3
        player.add_card Card.take_card
        puts 'Youre recived a card.'
        puts 'Dealers cards:  ' \
          "#{Array.new(dealer.face_value.size, '**').join(', ')}"
        puts "Your cards:     #{player.face_value.join(', ')}"
        puts "Your score:     #{player.score}"
      end
    end

    break
  end
  # rubocop:enable Metrics/BlockLength

  dealer_score = dealer.score
  player_score = player.score

  puts
  puts "Dealers cards:  #{dealer.face_value.join(', ')}"
  puts "Dealers score:  #{dealer_score}"
  puts "Your cards:     #{player.face_value.join(', ')}"
  puts "Your score:     #{player_score}"
  puts

  if dealer_score > 21 && player_score > 21 || \
     dealer_score == player_score && player_score < 21

    puts 'Draw!'
    dealer.cash += game_bank_d
    player.cash += game_bank_p
  elsif player_score > 21 || dealer_score > player_score
    puts 'Dealer win!'
    dealer.cash += (game_bank_d + game_bank_p)
  elsif dealer_score > 21 || dealer_score < player_score
    puts 'Player win!'
    player.cash += (game_bank_d + game_bank_p)
  end
  game_bank_d = 0
  game_bank_p = 0
  player.fold
  dealer.fold

  puts "Your cash: $#{player.cash}"
  puts "Thanks for game, #{name}"

  puts 'Play again?'
  puts '  1 - yes'
  again = gets.to_i
  playing = false if again != 1

  puts
  puts
end

puts 'See you later.'
