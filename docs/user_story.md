In order to keep using public transport
As a customer
I want to add money to my card

# irb
require './lib/oystercard.rb'
card = Oystercard.new
card.balance
card.top_up(10)
card.balance