# class for formatting messages for game
class View
  def initialize(player, dealer, game)
    @player = player
    @dealer = dealer
    @game = game
  end

  def show_cards(final = false, str = '')
    "\n#{str}\n" \
    "Dealers cards:  #{Array.new(@dealer.face_value.size, '**').join(', ')}\n" \
    "Dealers cards:  #{@dealer.face_value.join(', ')}\n" \
    "#{"Dealers score:  #{@dealer.score}" if final}\n" \
    "Your cards:     #{@player.face_value.join(', ')}\n" \
    "Your score:     #{@player.score}\n\n"
  end

  def check_action(gived = false)
    "\nCheck action:\n" \
    "  1 - skip\n" \
    "  2 - open cards\n" \
    "#{'  3 - give me a card' unless gived}\n"
  end

  def end_game
    "\nYour cash: $#{@player.cash}\n" \
    "Thanks for game, #{@player.name}\n" \
    "Play again?\n" \
    "  1 - yes\n"
  end

  def bank
    "Bank: $#{@game.bank}\n"
  end

  def congrats(player)
    "\nWinner: #{player.name}!\n"
  end

  def start_game
    "Your cash: $#{@player.cash}\n" \
    "Game started...\n\n"
  end
end
