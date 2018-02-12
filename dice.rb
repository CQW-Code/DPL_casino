

class Dice
  attr_accessor :dice, :score

  def initialize(num)
    @dice = Array.new(3) { rand(1..6) }
    @dice.sort!
    @score = self.set_score
  end

  # shake 'em up shake 'em up
  def roll_dice
    i = 0
    while i < @dice.length
      @dice[i] = rand(1..6)
      i += 1
    end
    @dice.sort!
    @score = self.set_score
  end

  # return an array of the dice value
  def show_dice(player_name = "UNKNOWN PLAYER")
    puts "#{player_name}'s hand: #{@dice} (score: #{@score})"
    return @dice
  end


  def set_score
    case @dice
      when [4,5,6]
        return 20
      when [1,2,3]
        return 0
    end
    if @dice[0] == @dice[1] && @dice[1] != @dice[2]
      return @dice[2]
    elsif @dice[0] != @dice[1] && @dice[1] == @dice[2]
      return @dice[0]
    elsif @dice[0] == @dice[2] && @dice[1] != @dice[2]
      return @dice[1]
    elsif @dice[0] == @dice[1] && @dice[1] == @dice[2]
      return @dice[0] * 2
    else
      return -1
    end
  end
      
end