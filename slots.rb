#Slots for Casino project
#three across *what kind of symbols?
#how much bet?
# nbr of spins?

class Slots

#require-relative "Casino"
require "pry"
#add color??

#attr_accessor :player

def initialize
  @slots_arr = [ "💎", "😎", "🍓", "🍒", "🍋", "💰", "🍎", "🍕", "🍺", "🖥"]
  #@player = Player.new()
end #end initialize

def slot_menu
  puts "How many spins do you want?"
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
        #Casino.menu        
  end #end case
end #slot_menu

def slot_bet
  #TODO- add or subtract dollar amount from wallet
  puts "your current bankroll is: "

end

def penny_slots
  puts "___________________"
  puts "| " + @slots_arr.sample(4).join(" | ") +" |"
  puts "___________________"
  @slot_bet
end # end penny_slots

def two_fer
    #how to do TWO rows..? iterate?
       twofer_arr = @slots_arr.sample(4).join(" | ") + " |"
       
    end #end loop
end #end two_fer

def mega_slot

end #end mega_slot
  
@slots = Slots.new
@slots.slot_menu


end #end class
