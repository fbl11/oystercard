require 'oystercard'

describe Oystercard do
  subject(:oyster) { described_class.new }

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
      expect { oyster.touch_in }.to raise_error("Cannot touch in: balance below £#{Oystercard::MINIMUM_BALANCE}")
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
        oyster.touch_in
        expect(oyster).to be_in_journey
      end

    end

    describe '#touch_out' do

      it "changes journey state to 'not in journey' after touching in" do
        oyster.touch_in
        oyster.touch_out
        expect(oyster).not_to be_in_journey
      end

    end
  
  end

end