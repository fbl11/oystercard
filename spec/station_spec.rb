require 'station'

describe Station do
  subject(:station) { described_class.new('bank', 1)}
  let(:name) { station.name }
  let(:zone) { station.zone }

  it 'returns the station name' do
    expect(station.name).to eq(name)
  end

  it 'returns the zone of the station' do
    expect(station.zone).to eq(zone)
  end

end