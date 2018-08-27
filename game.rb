# class for game logic
class Game
  attr_reader :player, :dealer

  def initialize(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def define_winner
    dscore = @dealer.score
    pscore = @player.score
    winner = nil
    if dscore > 21 && pscore > 21 || dscore == pscore && pscore < 21
      @dealer.cash += @dealer.bet
      @player.cash += @player.bet
    elsif pscore > 21 || (dscore > pscore && dscore <= 21)
      @dealer.cash += (@player.bet + @dealer.bet)
      winner = @dealer
    elsif dscore > 21 || (dscore < pscore && pscore <= 21)
      @player.cash += (@player.bet + @dealer.bet)
      winner = @player
    end
    fold

    winner
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

  def fold
    @player.fold
    @dealer.fold
  end

  def make_bet
    @player.make_bet
    @dealer.make_bet
  end

  def deal_cards
    @dealer.add_card @deck.take_card
    @dealer.add_card @deck.take_card
    @player.add_card @deck.take_card
    @player.add_card @deck.take_card

    make_bet
  end

  def bank
    @player.bet + @dealer.bet
  end
end
