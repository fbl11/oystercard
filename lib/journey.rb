class Journey

  attr_reader :exit_station
  attr_accessor :entry_station

  MINIMUM_FARE = 1



  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def charge_journey
    MINIMUM_FARE
  end

  def in_journey?
    entry_station
  end


end
