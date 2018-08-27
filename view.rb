# class for formatting messages for game
class View
  def initialize(game)
    @game = game
  end

  def show_cards(final = false, str = '')
    dcards = @game.dealer.face_value
    dcards = Array.new(dcards.size, '**') unless final
    dcards = dcards.join(', ')
    "\n#{str}\n" \
    "#{if final
         "Dealers cards:  #{dcards}\n" \
      "Dealers score:  #{@game.dealer.score}"
       end}\n" \
    "Your cards:     #{@game.player.face_value.join(', ')}\n" \
    "Your score:     #{@game.player.score}\n\n"
  end

  def check_action(gived = false)
    "\nCheck action:\n" \
    "  1 - skip\n" \
    "  2 - open cards\n" \
    "#{'  3 - give me a card' unless gived}\n"
  end

  def end_game
    "\nYour cash: $#{@game.player.cash}\n" \
    "Thanks for game, #{@game.player.name}\n" \
    "Play again?\n" \
    "  1 - yes\n"
  end

  def bank
    "Bank: $#{@game.bank}\n"
  end

  def congrats(player)
    "\nWinner: #{player.nil? ? 'none' : player.name}!\n"
  end

  def start_game
    "Your cash: $#{@game.player.cash}\n" \
    "Game started...\n\n"
  end
end
