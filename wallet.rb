class Wallet
  attr_accessor :balance

  def initialize(amount)
    @balance = amount
  end

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end

end