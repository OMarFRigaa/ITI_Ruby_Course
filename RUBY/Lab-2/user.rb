class User
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def to_s
    @name
  end
end
