#Slots for Casino project

#setting bets and adding/subtracting to wallet- works
#exiting to casino main_menu not working (yet)
# might be missing some other stuff but the majority is working!
#enjoy!

class Slots

require_relative "wallet"
require_relative "player"
require_relative "casino"

#add color??

attr_accessor   :slots_arr, :bet, :amount, :name, :wallet, :balance, :list_games, :main_menu

def initialize
  @slots_arr = [ "💎", "😎", "🍓", "🍒", "🍋", "💰", "🍎", "🍕", "🍺", "🖥"]
  #@player = Player.new("Ducky", 50)
  @wallet = Wallet.new(50)
  @balance = balance
  list_games
  main_menu
  slot_menu
  @amount = amount
  #@name = name
  @wallet = wallet
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
        puts "Sorry to see you go!"
        @casino.main_menu  
    else 
      puts "Not a valid selection."   
  end #end case
end #slot_menu


def match(amount)
  
  if @slots_arr[0] == @slots_arr[1] && @slots_arr[0] == @slots_arr[2] && @slots_arr[0] == @slots_arr[3]
     # @player.wallet.increase_balance(@bet)
      puts "its a match!"
  else
      @wallet.decrease_balance(amount)
      puts "it's not a match!"
      
  end
end

def penny_slots
  amount = 1
  puts "_____________________"
  puts "| " + @slots_arr.sample(4).join(" | ") +" |"
  puts "---------------------"
  puts 
  match(amount)
  puts "your balance is now: $#{@wallet.balance}"
  exit_slots
end # end penny_slots

def two_fer
   amount = 2
   
    puts "_____________________"
    puts "| " + @slots_arr.sample(4).join(" | ") +" |"
    puts "_____________________"
    puts "| " + @slots_arr.sample(4).join(" | ") + " |"
    puts "---------------------"
    puts
    match(amount)
    puts "your balance is now: $#{@wallet.balance}" 

    exit_slots
   
end #end two_fer

def mega_slot
  amount  = 5
  #a little neater- not the neatest looking rows
  
  puts "---------------------"
  puts "| " + @slots_arr.sample(4).join(" | ") + " | "
  puts "---------------------"
  puts "| " + @slots_arr.sample(4).join(" | ") + " |"
  puts "---------------------"
  puts "| " + @slots_arr.sample(4).join(" | ") +  " |"
  puts "---------------------"
  puts "| " + @slots_arr.sample(4).join(" | ") +  " |"
  puts "---------------------"
  puts "| " + @slots_arr.sample(4).join(" | ") +  " |"
  puts "---------------------"
  match(amount)
  puts "your balance is now: $#{@wallet.balance} " 
  exit_slots
end #end mega_slot
 
def exit_slots
  puts "Do you want to continue Y or N?"
  exit_yn = gets.strip.downcase
  if exit_yn == "y"
    slot_menu
  else 
    @casino.list_games 
  end #end if
end #end exit_slots
@slots = Slots.new





end #end class
 