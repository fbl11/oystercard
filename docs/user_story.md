In order to use public transport
As a customer
I want money on my card

# irb
require './lib/oystercard.rb'
card = Oystercard.new
card.balance

In order to keep using public transport
As a customer
I want to add money to my card

# irb
require './lib/oystercard.rb'
card = Oystercard.new
card.balance
card.top_up(10)
card.balance

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

# irb
require './lib/oystercard.rb'
card = Oystercard.new
card.top_up(100)
card.balance

In order to pay for my journey
As a customer
I need my fare deducted from my card

# irb
require './lib/oystercard.rb'
card = Oystercard.new
card.top_up(50)
card.deduct_fare(5)