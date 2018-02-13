require_relative 'casino'
require_relative 'blackjack'
require_relative 'player'
require_relative 'wallet'

@wallet = Wallet.new(500)
@player1 = Player.new("Reid", @wallet)
Blackjack.new(@player1, Casino.new)