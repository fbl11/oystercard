require 'oystercard'

describe Oystercard do

  describe "#balance" do
    
    it 'returns an initial @balance of 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe "#top_up" do

    it 'updates the balance when passed a value' do
      value = rand(1..50)
      expect{subject.top_up(value)}.to change{subject.balance}.by(value)
    end
    it 'does not permit @balance to go beyond £90' do
      value = 100
      expect{subject.top_up(value)}.to raise_error("Value exceeds maximum allowed")
    end

  end

end