class Die
  attr_accessor :value
  
  def initialize
    @value = rand(1..6)
    return @value
  end

  def roll
    @value = rand(1..6)
    return @value
  end

end