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

  # there is a bug somewhere in this function.
  
  def card_total(hand)
    card_total = 0
    aces_count = 0
    hand.each do |card|
      if card.rank == 'K' || card.rank == 'Q' || card.rank == 'J'
        card_total += 10
      elsif card.rank == 'A'
        card_total += 11
        aces_count += 1
      else
        card_total += card.rank.to_i
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

  def hit(whom)
    if whom = 'player'
      @player_hand << @cards.pop
    else
      @dealer_hand << @cards.pop
    end
  end

  def stay
    hit('dealer')
    while true
      if card_total(@dealer_hand) > 21
        puts "\tDealer busts with #{card_total(@dealer_hand)}! You win #{@bet}."
        @player.wallet.increase_balance(@bet)
        Blackjack.new(@player, @casino)
      elsif card_total(@dealer_hand) < 21 && card_total(@dealer_hand) > card_total(@player_hand)
        puts "\tDealer wins with #{card_total(@dealer_hand)} vs your #{card_total(@dealer_hand)}"
        Blackjack.new(@player, @casino)
      elsif card_total(@dealer_hand) == card_total(@player_hand)
        puts "\tPush!"
        Blackjack.new(@player, @casino)
      else
        hit('dealer')
      end
    end
  end

  def play

    if card_total(@player_hand) > 21
      puts "\tYou've busted! You lose $#{@bet}."
      @player.wallet.decrease_balance(@bet)
      Blackjack.new(@player, @casino)
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
          hit('player')
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
      Blackjack.new(@player, @casino)
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
      @bet = gets.strip.to_i
    end
    @bet = @bet.to_i
  end

  def start_game
    puts "\tWelcome to Blackjack, #{@player.name}!"
    my_bet = get_bet
    initial_deal
  end

end
