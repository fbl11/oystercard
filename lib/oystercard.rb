class Oystercard

  attr_reader :balance, :station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @station = "Station name"
  end

  def top_up(amount)
    fail "Cannot top up: exceeds cap of £#{MAXIMUM_BALANCE}" if above_cap?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Cannot touch in: balance below £#{MINIMUM_BALANCE}" if below_minimum?
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end





  private

  def above_cap?(amount)
    amount + balance > MAXIMUM_BALANCE
  end

  def below_minimum?
    balance < MINIMUM_BALANCE
  end

  def deduct(fare)
    @balance -= fare
  end

end
