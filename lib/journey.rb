class Journey

  attr_reader :exit_station, :entry_station
  # attr_accessor :entry_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end
 
  def end_at(exit_station = nil)
    @exit_station = exit_station
  end

  def calculate_fare
    return MINIMUM_FARE if complete?
    PENALTY_FARE
  end

  def complete?
    entry_station && exit_station
  end

end
