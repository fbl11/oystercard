class Journey

  attr_reader :entry_station, :exit_station
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


end
