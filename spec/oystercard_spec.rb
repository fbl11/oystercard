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

    it 'allows the user to touch in' do
      expect(subject).to respond_to(:touch_in)
    end

  end

end