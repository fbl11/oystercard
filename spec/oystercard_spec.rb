require 'oystercard'

describe Oystercard do

  describe "#balance" do
    
    it 'returns an initial @balance of 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe "#top_up" do

    it 'updates the balance when passed a value' do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

  end

end