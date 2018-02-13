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
        user_input = gets.strip.to_i
        card1 = @cards.pop
        numeric_value(card1)
        puts "Your card is the #{card1.rank} of #{card1.suit}"
        puts "Will the next card be high(1) or low(2)?"
        user_input = gets.to_i
        card2 = @cards.pop
        numeric_value2(card2)
        puts "Your second card is the #{card2.rank} of #{card2.suit}"
        case  user_input
            when 1
                if @value1 < @value2  
                    puts "You win!"
                else 
                    puts "You lose!"
                end 
            when 2
                if @value1 > @value2 
                    puts "You win!"
                else 
                    puts "You lose!"
            end 
        end 
        start_game
        
    end 
     

    def numeric_value(card1)
        faces = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A'=> 1}
        begin 
            if Integer(card1.rank).is_a?(Numeric)
                @value1 = card1.rank.to_i
            end
        rescue => e 
            @value1 = faces[card1.rank]
        end 
        @value1 
    end 
    
    def numeric_value2(card2)
        faces = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A'=> 1}
        begin 
            if Integer(card2.rank).is_a?(Numeric)
                @value2 = card2.rank.to_i
            end
        rescue => e 
            @value2 = faces[card2.rank]
        end 
        @value2 
    end 
end 
HighLow.new 