class Oystercard

  attr_reader :balance, :history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @history = []
    @journey = journey
  end

  def top_up(amount)
    fail "Cannot top up: exceeds cap of £#{MAXIMUM_BALANCE}" if above_cap?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Cannot touch in: balance below £#{MINIMUM_BALANCE}" if below_minimum?
    @journey.start_journey(station)
  end

  def touch_out(exit_station)
    deduct
    @journey.end_journey(exit_station)
    save_journey
  end

  def in_journey?
    @journey.in_journey?
  end


  private

  def above_cap?(amount)
    amount + balance > MAXIMUM_BALANCE
  end

  def below_minimum?
    balance < MINIMUM_BALANCE
  end

  def deduct
    @balance -= @journey.charge_journey
  end

  def save_journey
    @history << { :entry => @journey.entry_station, :exit => @journey.exit_station }
    @journey.entry_station = nil
  end

end
