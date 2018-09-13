require 'journey.rb'

describe Journey do

  subject(:journey) { described_class.new('entry_station') }
  let(:entry_station) { journey.entry_station }

  it 'starts a journey' do
    expect(journey.entry_station).to eq(entry_station)
  end

end
