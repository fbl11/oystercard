require 'oystercard'

describe Oystercard do

  describe "#balance" do
    
    it "returns the @balance on the Oystercard" do
      expect(subject).to respond_to(:balance)
    end

  end

end