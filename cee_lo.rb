require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'dice'
require_relative 'casino'


class Cee_lo
  attr_accessor :player, :bet, :dealer, :player_hand, :dealer_hand

  def initialize(player1)
    @bet = 0
    @player = player1
    @dealer = Player.new("Dealer", 9999999999)
    @player_hand = Dice.new(3)
    @dealer_hand = Dice.new(3)
  end

  def compare(hand1, hand2)

    if hand1.score == hand2.score
      puts "Tie. Nobody wins."
    elsif hand1.score > hand2.score
      puts "You win #{@bet}!".colorize(:green)
      @player.wallet.increase_balance(@bet)
    else
      puts "You lose #{@bet}. Pay up, sucka!".colorize(:red)
      @player.wallet.decrease_balance(@bet)
    end
  end

  def get_bet
    print "Enter your bet amount: "
    @bet = $stdin.gets.strip.to_i
    while @bet > @player.wallet.balance
      puts "You only have $#{@player.wallet.balance}."
      print "You have to bet less than that."
      @bet = $stdin.gets.strip.to_i
    end
  end

  def show(hand, player_name)

    puts "#{player_name}'s hand: #{hand.show_dice} (score: #{@score})"
  
  end

  def take_turn(dice)
    while dice.score < 0
      dice.roll_dice
    end
    return dice
  end

  def play_game(order)
    case order
      when 1
        @player_hand = take_turn(@player_hand)
        show(@player_hand)
        @dealer_hand = take_turn(@dealer_hand)
        compare(@player_hand, @dealer_hand)
      when 2
        @dealer_hand = take_turn(@dealer_hand)
        show(@dealer_hand)
        @player_hand = take_turn(@dealer_hand)
        compare(@player_hand, @dealer_hand)
    end
  end

  def exit_game()

  end

  def start_game(player1)
    puts "\t Welcome to the game, #{player1.name}!"
    my_bet = self.get_bet
    print "\t Do you want to roll 1) First or 2) Second? or 3) Not at all?"
    choice = $stdin.gets.strip.to_i

    # Loop to get a valid menu choice
    while choice != 1 && choice != 2 && choice != 3
      print "Invalid option. Enter choice 1 or 2. ".colorize(:red)
      choice = $stdin.gets.strip.to_i
      case choice
        when 1
          play_game(1)
        when 2
          play_game(2)
        when 3
          self.exit_game
      end
    end

  end
    


# End the class 
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

@game = Cee_lo.new(@player1)
@game.start_game(@player1)

@game.compare(@player_hand, @dealer_hand)