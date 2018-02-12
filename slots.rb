#Slots for Casino project
#three across *what kind of symbols?
#how much bet?
# nbr of spins?

class Slots

#require_relative "player"
#require_relative "wallet"
require "pry"
#add color??

attr_accessor :player, :wallet, :balance, :result2, :result3, :result4, :result5

def initialize
  @slots_arr = [ "💎", "😎", "🍓", "🍒", "🍋", "💰", "🍎", "🍕", "🍺", "🖥"]
  #@player = Player.new()
  @balance = balance
  @result2 = result2
  @result3 = result3
  @result4 = result4
  @result5 = result5

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
        #Casino.menu
        "Sorry to see you go!"
        exit        
  end #end case
end #slot_menu



def match
  if @slots_arr[0] == @slots_arr[1] && @slots_arr[0] == @slots_arr[2] && @slots_arr[0] == @slots_arr[3]
      #@wallet.increase_balance
      puts "its a match!"
  else
      #@wallet.decrease_balance
      puts "it's not a match!"
  end
end

def penny_slots
  puts "_____________________"
  puts "| " + @slots_arr.sample(4).join(" | ") +" |"
  puts "_____________________"
  puts 
  match
  puts "your balance is now: " #need the actual balance
end # end penny_slots

def two_fer
    #how to do TWO rows..? iterate? must be a neater way to
    #determine how many spins...?
    result2 = @slots_arr.sample(4).join(" | ")
    puts "_____________________"
    puts "| " + @slots_arr.sample(4).join(" | ") +" |"
    puts "_____________________"
    puts "| " + " #{result2}" + " |"
    puts "_____________________"
    puts
    puts "your balance is now: " #need the actual balance
    
    exit
   
end #end two_fer

def mega_slot
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
  puts "your balance is now: " #need the actual balance
end #end mega_slot
  
@slots = Slots.new
@slots.slot_menu
#@slots.penny_slots
#@slots.two_fer
#@slots.mega_slot


end #end class
