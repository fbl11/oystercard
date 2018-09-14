require 'journey.rb'

describe Journey do
  subject(:journey) { described_class.new(entry_station = nil) }
  let(:station) { double :station }
  # let(:entry_station) { journey.entry_station }
  # let(:exit_station) { journey.exit_station}

  it 'a new journey can begin without an entry station' do
    new_journey = described_class.new
    expect(new_journey.entry_station).to eq(nil)
  end

  it 'a new journey can be given an entry station' do
    new_journey = described_class.new(entry_station = station)
    expect(new_journey.entry_station).to eq(station)
  end

  describe '#end_at' do

    it 'a journey can be ended without an exit station' do
      new_journey =  described_class.new
      new_journey.end_at
      expect(new_journey.exit_station).to eq(nil)
    end

    it 'a journey can be ended at an exit station' do
      new_journey = described_class.new
      new_journey.end_at(station)
      expect(new_journey.exit_station).to eq(station)
    end

  end

  describe '#calculate_fare' do
    
    it 'returns the MINIMUM_FARE on complete journeys' do
      new_journey = described_class.new(station)
      new_journey.end_at(station)
      expect(new_journey.calculate_fare).to eq(Journey::MINIMUM_FARE)
    end

    it 'returns a PANALTY_FARE on imcomplete journeys' do
      new_journey = described_class.new
      new_journey.end_at(station)
      expect(new_journey.calculate_fare).to eq(Journey::PENALTY_FARE)
    end

  end

  describe '#complete?' do
   
    it 'indicates that a journey that has an entry and exit station is complete' do
     new_journey = described_class.new(station)
     new_journey.end_at(station)
     expect(new_journey).to be_complete
    end

    it 'indicates that a journey that does not have an exit station is incomplete' do
    new_journey = described_class.new(station)
    new_journey.end_at
    expect(new_journey).not_to be_complete
    end

    it 'indicates that a journey that does not have an entry station is incomplete' do
    new_journey = described_class.new
    new_journey.end_at(station)
    expect(new_journey).not_to be_complete
    end

  end

end
