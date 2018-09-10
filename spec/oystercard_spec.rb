require 'oystercard'

describe Oystercard do

  describe "#balance" do
    
    it 'returns an initial @balance of 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe "#top_up" do

    it 'adds money to the Oystercard @balance' do
      expect(subject).to respond_to(:top_up)
    end

  end

end