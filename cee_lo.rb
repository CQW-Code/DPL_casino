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

    show(@dealer_hand, "Dealer")
    show(@player_hand, @player.name)

    if hand1.score == hand2.score
      puts "\tTie. Nobody wins."
      start_game(@player)
    elsif hand1.score > hand2.score
      puts "\tYou win #{@bet}!".colorize(:green)
      @player.wallet.increase_balance(@bet)
    else
      puts "\tYou lose #{@bet}. Pay up, sucka!".colorize(:red)
      @player.wallet.decrease_balance(@bet)
    end
  end

  def get_bet
    print "\tEnter your bet amount: "
    @bet = $stdin.gets.strip.to_i
    while @bet > @player.wallet.balance
      puts "\tYou only have $#{@player.wallet.balance}."
      print "\tYou have to bet less than that."
      @bet = $stdin.gets.strip.to_i
    end
  end

  def show(hand, player_name)

    puts "#{player_name}'s hand: #{hand.dice} (score: #{hand.score})"
  
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
        
        @dealer_hand = take_turn(@dealer_hand)
        compare(@player_hand, @dealer_hand)
      when 2
        @dealer_hand = take_turn(@dealer_hand)
        
        @player_hand = take_turn(@player_hand)
        compare(@player_hand, @dealer_hand)
    end
  end

  def exit_game

  end

  def start_game(player1)
    puts "\n\n\tWelcome to Cee-Lo, #{player1.name}!"
    my_bet = get_bet
    print "\tDo you want to roll 1) First or 2) Second? or 3) Not at all? "
    choice = gets.strip.to_i

    # Loop to get a valid menu choice
    while choice != 1 && choice != 2 && choice != 3
      print "\tInvalid option. Enter choice 1 or 2. ".colorize(:red)
      choice = gets.strip.to_i
    end
    case choice
      when 1
        play_game(1)
      when 2
        play_game(2)
      when 3
        exit_game
    end

  end
    


# End the class 
end


@wallet1 = Wallet.new(500)
@wallet2 = Wallet.new(1000000000)

@player1 = Player.new("Reid", @wallet1)
@player2 = Player.new("Dealer", @wallet2)

@game = Cee_lo.new(@player1)
@game.start_game(@player1)