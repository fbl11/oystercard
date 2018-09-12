require 'oystercard'

describe Oystercard do
  subject(:oyster) { described_class.new }
  let(:station) { double :station }

  describe "#balance" do

    it 'returns an initial @balance of 0' do
      expect(oyster.balance).to eq(0)
    end

  end

  describe "#top_up" do

    it 'increases @balance by #top_up amount' do
      amount = rand(1..50)
      expect { oyster.top_up(amount) }.to change { oyster.balance }.by(amount)
    end

    it 'does not permit @balance to go beyond MAXIMUM_BALANCE' do
      amount = Oystercard::MAXIMUM_BALANCE + 1
      expect { oyster.top_up(amount) }.to raise_error("Cannot top up: exceeds cap of £#{Oystercard::MAXIMUM_BALANCE}")
    end

  end

  describe '#touch_in' do

    it 'raises error when @balance is below MINIMUM_BALANCE' do
      expect { oyster.touch_in(station)}.to raise_error("Cannot touch in: balance below £#{Oystercard::MINIMUM_BALANCE}")
    end

  end

  describe '#touch_out' do

    it 'deducts the minimum fare from Oyster' do
      fare = Oystercard::MINIMUM_FARE
      expect { oyster.touch_out }.to change { oyster.balance }.by(-fare)
    end

  end



  context 'Oyster is topped up to MINIMUM BALANCE' do

    before :each do
      oyster.top_up(Oystercard::MINIMUM_BALANCE)
    end

    describe '#touch_in' do

      it "changes journey state to 'in journey' after touching in" do
        oyster.touch_in(station)
        expect(oyster).to be_in_journey
      end

      it 'stores the station where the card is touched in' do
        oyster.touch_in(station)
        expect(oyster.station).to eq(station)
      end

      it 'can be passed the station name as an argument' do
        expect(oyster).to respond_to(:touch_in).with(1).argument
      end
      describe 'history' do

        it 'displays the history of journeys on the card' do
          oyster.touch_in(station)
          oyster.touch_out(station)
          expect(oyster.history).to eq history
        end
      end
    end

    describe '#touch_out' do

      before :each do
        oyster.touch_in(station)
        oyster.touch_out
      end

      it "changes journey state to 'not in journey' after touching out" do
        expect(oyster).not_to be_in_journey
      end

      it 'deletes station saved on card' do
        expect(oyster.station).to be(nil)
      end

    end

  end

end
