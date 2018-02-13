require_relative 'casino'
require_relative 'blackjack'
require_relative 'player'
require_relative 'wallet'
require_relative 'slots'


@wallet = Wallet.new(500)
@player1 = Player.new("Reid", @wallet)

my_casino = Casino.new
