describe 'User Stories' do
  let(:oyster) { Oystercard.new } # globally sets 'card = Oystercard.new' so it does not have to be declared in each example
  MAXIMUM_BALANCE = 90 # explicitly declared here instead of using oystercard.rb constant to flag up if constant has been changed in oystercard.rb
 
  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'to use public transport, Oysters need a balance' do
    expect(oyster.balance).to eq(0)
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'to continue using transport, add money to Oyster' do
    amount = rand(1..50)
    expect { oyster.top_up(amount) }.to change { oyster.balance }.by(amount)
  end

  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card
  it 'to protect from theft, Oyster balance should be capped' do
    expect { oyster.top_up(MAXIMUM_BALANCE + 1) }.to raise_error("Cannot top up: exceeds cap of £#{MAXIMUM_BALANCE}")
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card
    #NO LONGER EXPLICITLY REQUIRED BECAUSE IT'S IMPLICITLY TESTED BY TOUCH_OUT METHOD 
    # it 'to pay for journey, fare needs to be deducted from Oyster balance' do
    #    oyster.top_up(50)
    #    fare = rand(1..5)
    #    expect { oyster.deduct(fare) }.to change { oyster.balance }.by(-fare)
    # end

  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.
  it 'to pass barriers, Oysters can be touched in an out' do
    expect { oyster.to respond_to(:touch_in) }
    expect { oyster.to respond_to(:touch_out) }
    expect { oyster.to respond_to(:in_journey?) }
  end

  # In order to pay for my journey
  # As a customer
  # I need to have the minimum amount (£1) for a single journey.


  # In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card

end
