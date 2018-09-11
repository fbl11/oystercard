describe 'User Stories' do
  let(:card) { Oystercard.new } # globally sets 'card = Oystercard.new' so it does not have to be declared in each example
  MAXIMUM_BALANCE = 90 # explicitly declared here instead of using oystercard.rb constant to flag up if constant has been changed in oystercard.rb
  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'to use public transport, Oysters need a balance' do
    expect(card.balance).to eq(0)
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'to continue using transport, add money to Oyster' do
    amount = rand(1..50)
    expect { card.top_up(amount) }.to change { card.balance }.by(amount)
  end

  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card
  it 'to protect from theft, Oyster balance should be capped' do
    expect { card.top_up(MAXIMUM_BALANCE + 1) }.to raise_error
  end
end