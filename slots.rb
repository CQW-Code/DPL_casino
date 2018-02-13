#Slots for Casino project

#Haven't gotten the wallet/bet part working.. I can't seem to connect
#to the player or wallet classes not sure why
#looks a little messy but it works for the slot part!
#enjoy!

class Slots

#require_relative "wallet"
#require_relative "player"
#require_relative "casino"
require "pry"
#add color??

attr_accessor  :bet, :result2, :result3, :result4, :result5

def initialize
  @slots_arr = [ "💎", "😎", "🍓", "🍒", "🍋", "💰", "🍎", "🍕", "🍺", "🖥"]
  @result2 = result2
  @result3 = result3
  @result4 = result4
  @result5 = result5
  @bet = bet

end #end initialize

def slot_menu
  puts "Place your bet and spin: "
  puts "1) Penny Slots- $1"
  puts "2) Two-fer Slots- $2"
  puts "3) Mega Slots- $5"
  puts "4) Get me out of here- Exit"
  choice = gets.to_i
  case choice
    when 1
        penny_slots
    when 2
        two_fer
    when 3
        mega_slot
    when 4
        
        "Sorry to see you go!"
        exit        
  end #end case
end #slot_menu



def match(bet)
  if @slots_arr[0] == @slots_arr[1] && @slots_arr[0] == @slots_arr[2] && @slots_arr[0] == @slots_arr[3]
     # @player.wallet.increase_balance(@bet)
      puts "its a match!"
  else
     # @player.wallet.decrease_balance(@bet)
      puts "it's not a match!"
  end
end

def penny_slots
  @bet = 1.00
  puts "_____________________"
  puts "| " + @slots_arr.sample(4).join(" | ") +" |"
  puts "_____________________"
  puts 
  match
  puts "your balance is now: $ #{@bet}"
end # end penny_slots

def two_fer
   bet = 2.00
    result2 = @slots_arr.sample(4).join(" | ")
    puts "_____________________"
    puts "| " + @slots_arr.sample(4).join(" | ") +" |"
    puts "_____________________"
    puts "| " + " #{result2}" + " |"
    puts "_____________________"
    puts
    puts "your balance is now: $ #{@bet}" #need the actual balance
    
    exit
   
end #end two_fer

def mega_slot
  bet = 5.00
  #too much... think there is a better way for this
  result2 = @slots_arr.sample(4).join(" | ")
  result3 = @slots_arr.sample(4).join(" | ")
  result4 = @slots_arr.sample(4).join(" | ")
  result5 = @slots_arr.sample(4).join(" | ")
  puts "____________________"
  puts "| " + @slots_arr.sample(4).join(" | ") +" |"
  puts "____________________"
  puts "| " + "#{result2}" + " |"
  puts "____________________"
  puts "| " + "#{result3}" + " |"
  puts "_____________________"
  puts "| " + "#{result4}" + " |"
  puts "_____________________"
  puts "| " + " #{result5}" + " |"
  puts "_____________________"
  puts
  puts "your balance is now: $ #{@bet} " #need the actual balance
end #end mega_slot
  
@slots = Slots.new()
#@player = Player.new("Ducky")
#@wallet = Wallet.new(50)
@slots.slot_menu



end #end class
