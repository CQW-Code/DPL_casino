require 'pry'

require_relative 'player'
require_relative 'dice'
require_relative 'casino'

class Cee_lo
  attr_accessor :players, :point

  def initialize(players)
    @point = 0
    @players = players
  end

  def bet(amount)
    # TODO
  end

  def compare(hand1, hand2)
    if hand1.score == hand2.score
      puts "Tie. Keep rolling"
    elsif hand1.score > hand2.score
      puts "Hand 1 wins"
    else
      puts "Hand 2 wins"
    end
  end

  def get_bet
    print "Enter your bet amount: "
    bet = chomp.gets.to_i
    if 

  def start_game(player1)
    puts "\t Welcome to the game, #{player1.name}!"
    print "Enter your bet amount: "
    


# End the class 
end

def show(hand, player_name)

  puts "#{player_name}'s hand: #{hand.show_dice} (score: #{@score})"

end

@player_hand = Dice.new(3)
@dealer_hand = Dice.new(3)

@player_hand.roll_dice
@dealer_hand.roll_dice

@player_hand.show_dice("Reid")
@dealer_hand.show_dice("Dealer")

@wallet1 = Wallet.new(500)
@wallet2 = Wallet.new(1000000000)

@player1 = Player.new("Reid", @wallet1)
@player2 = Player.new("Dealer", @wallet2)

@players = []
@players << @player1
@players << @player2
@game = Cee_lo.new(@players)

@game.compare(@player_hand, @dealer_hand)