require 'oystercard'

describe Oystercard do

  describe "#balance" do
    
    it "returns the @balance on the Oystercard" do
      expect(subject).to respond_to(:balance)
    end
    it 'returns an initial @balance of 0' do
      expect(subject.balance).to eq(0)
    end

  end

end