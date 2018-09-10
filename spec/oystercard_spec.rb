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

    it 'does not permit @balance to go beyond MAXIMUM_BALANCE' do
      value = Oystercard::MAXIMUM_BALANCE + 1
      expect{subject.top_up(value)}.to raise_error("Value exceeds maximum allowed: #{Oystercard::MAXIMUM_BALANCE}")
    end

  end

  describe '#deduct' do
    
    it 'updates @balance after fare has been deducted' do
      fare = rand(1..5)
      expect{subject.deduct(fare)}.to change{subject.balance}.by(-fare)
    end

  end

  describe '#touch_in' do

    it "changes @status of Oystercard to 'true' ('in journey')" do
      expect(subject.touch_in).to eq(true)
    end
    
  end

  describe '#touch_out' do

    it "changes @status of Oystercard to 'false' ('not in journey')" do
      expect(subject.touch_out).to eq(false)
    end

  end

  describe '#in_journey?' do

    it 'shows whether a card is in journey' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'shows whether a card is in journey' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end


  end

end