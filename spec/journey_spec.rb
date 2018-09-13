require 'journey.rb'

describe Journey do

  subject(:journey) { described_class.new }
  let(:entry_station) { journey.entry_station }
  let(:exit_station) { journey.exit_station}

  describe '#start_journey' do
    it 'starts a journey' do
      expect(journey.entry_station).to eq(entry_station)
    end
  end

  describe '#end_journey' do
    it 'ends a journey' do
      expect(journey.exit_station).to eq(exit_station)
    end
  end

  describe '#charge_journey' do
    it 'contains the MINIMUM FARE' do
     expect(journey.charge_journey).to eq(Journey::MINIMUM_FARE)
    end
  end

end
