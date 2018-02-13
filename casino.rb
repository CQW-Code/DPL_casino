require_relative 'player'

class Casino
  attr_accessor :games, :player

  def initialize(games, player)
    @player = player
    @games = games
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
    list_games
    print "\tWhat would you like to play? "
    game_choice = gets.strip.to_i
    puts "#{@games[game_choice-1]}"

  end

end

@reid = Player.new("Reid", 500)

@casino_games = ["Blackjack", "High-Low", "Cee-Lo", "Slots"]
@casino = Casino.new(@casino_games, @reid)
@casino.main_menu
