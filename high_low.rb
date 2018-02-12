require_relative 'deck'

class HighLow
    attr_accessor :cards 
    
    def initialize 
        deck = Deck.new 
        @cards = deck.shuffle_cards
        start_game 
    end

    def start_game
        puts "LET'S PLAY!"
        puts "How much would you like to bet?"
        user_input = gets.strip.to_f 
        card1 = @cards.pop
        puts "Your card is the #{card1.rank} of #{card1.suit}"
        puts "Will the next card be high(1) or low(2)?"
        user_input = gets.strip 
        card2 = @cards.pop
        puts "Your second card is the #{card2.rank} of #{card2.suit}"
        case  user_input
            when "1"
                if card1.rank < card2.rank  
                    puts "You win!"
                else 
                    puts "You lose!"
                end 
            when "2"
                if card1.rank > card2.rank 
                    puts "You win!"
                else 
                    puts "You lose!"
            end 
        end 
    end 

    def numeric_value 
        faces = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A'=> 1}
        begin 
            if integer(card.rank).is_a?(Numeric)
                value = card.rank.to_i
            end
        rescue => e 
            value = faces[card.rank]
        end 
        value 
    end 
end 
HighLow.new 