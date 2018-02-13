require_relative 'player'
require_relative 'blackjack'
require_relative 'high_low'
require_relative 'slots'
require_relative 'cee_lo'

class Casino
  attr_accessor :games, :player

  def initialize
    @games = ["Slots", "High-Low", "Cee-Lo", "Blackjack"]
    main_menu
  end

  def list_games

    # List all the games, with a number next 
    @games.each_with_index do |game, i|
      puts "\t#{i+1}) #{game}"
    end
    puts "\t#{games.length+1}) Exit"
  end

  def main_menu
    puts "\nWelcome to the extravagant Ruby Casino!"
    print "\What is your name? "
    name = gets.strip
    print "\tHow much money did you bring? "
    money = gets.strip.to_i
    wallet = Wallet.new(money)
    @player = Player.new(name, wallet)
    list_games
    print "\tWhat would you like to play? "
    game_choice = gets.strip.to_i
    case game_choice
      when 1
        Slots.new.slot_menu(@player, self)
      when 2
        HighLow.new(@player, self)
      when 3
        Cee_lo.new(@player, self)
      when 4
        Blackjack.new(@player, self)
    end
  end

end
