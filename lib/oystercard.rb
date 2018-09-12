class Oystercard

  attr_reader :balance, :station, :history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @history = []
  end

  def top_up(amount)
    fail "Cannot top up: exceeds cap of £#{MAXIMUM_BALANCE}" if above_cap?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Cannot touch in: balance below £#{MINIMUM_BALANCE}" if below_minimum?
    @station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @history << { :entry => station, :exit => exit_station }
    @station = nil
  end

  def in_journey?
    station
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
