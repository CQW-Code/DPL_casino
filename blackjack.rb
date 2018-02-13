require 'colorize'
require_relative 'deck'
require_relative 'player'
require_relative 'casino'


class Blackjack
  attr_accessor :cards

  def initialize(player1, casino)
    @player = player1
    @casino = casino
    deck = Deck.new
    @bet = 0
    @cards = deck.shuffle_cards
    @player_hand = []
    @dealer_hand = []
    start_game
  end

  def card_total(hand)
    card_total = 0
    aces_count = 0
    hand.each do |card|
      if card.rank == 'K' || card.rank == 'Q' || card.rank == 'J'
        card_total += 10
      elsif card.rank == 'A'
        card_total += 11
        aces_count += 1
      end
    end
    if card_total > 21 && aces_count > 0
      i = 0
      while i < aces_count
        card_total -= 10
        i += 1
      end
    end
    return card_total
  end

  def hit

  end

  def stay

  end

  def play

    if card_total(@player_hand) > 21
      puts "\tYou've busted!"
      @player.wallet.decrease_balance(@bet)
      start_game
    else
      puts "\tYou have #{card_total(@player_hand)}."
      puts "\tWhat's your play?"
      puts "\t1) Hit"
      puts "\t2) Stand"
      print "\t>> "
      choice = $stdin.gets.strip.to_i
      while choice != 1 && choice != 2
        print "Invalid option".colorize(:red)
        choice = $stdin.gets.strip.to_i
      end
      case choice
        when 1
          hit(@player_hand)
          play
        when 2
          stay
      end
    end
  end

  def exit_game
    @casino.main_menu
  end

  # deal two cards to the player, and one to the dealer
  def initial_deal
    @player_hand << @cards.pop
    @dealer_hand << @cards.pop
    @player_hand << @cards.pop
    if card_total(@player_hand) == 21
      puts "\tBLACKJACK! You win #{@bet * 1.5}."
      @player.wallet.increase_balance(@bet * 1.5)
      start_game
    else
      puts "\tDealer shows a #{@dealer_hand[0].rank}."
      play
    end
  end

  def get_bet
    print "\tEnter your bet amount, or type 'quit' to leave the table. "
    @bet = $stdin.gets.strip
    if @bet == 'quit'
      exit_game
    end
    while @bet.to_i > @player.wallet.balance && @bet != 'quit'
      puts "\tYou only have $#{@player.wallet.balance}."
      print "\tYou have to bet less than that."
      @bet = $stdin.gets.strip.to_i
    end
  end

  def start_game
    puts "\tWelcome to Blackjack, #{@player.name}!"
    my_bet = get_bet
    initial_deal
  end

end

@casino = Casino.new()
@wallet = Wallet.new(500)
@player1 = Player.new("Reid", @wallet)
@game = Blackjack.new(@player1)