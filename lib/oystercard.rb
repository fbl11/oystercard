class Oystercard

  attr_reader :balance, :status
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @status = true
  end

  def top_up(value)
    fail "Value exceeds maximum allowed: #{MAXIMUM_BALANCE}" if value + @balance > MAXIMUM_BALANCE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    
  end

  def touch_out
    
  end

end