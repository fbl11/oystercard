class Oystercard

  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Value exceeds maximum allowed: #{MAXIMUM_BALANCE}" if value + @balance > MAXIMUM_BALANCE
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
