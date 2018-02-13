class Card
  attr_accessor :rank, :suit, :color, :value

  def initialize(rank, suit, color, value)
    @rank = rank
    @suit = suit
    @color = color
    @value = value 
  end
end
