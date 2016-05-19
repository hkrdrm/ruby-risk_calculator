rval = 3                # Risk multiplier to determine profit
market_price = 13.97    # Current market price / buy in pice
order_size = 3.5
usd_risk = 0.4
short = true

total_usd_price = order_size * market_price

if(short)
  exit_price = (total_usd_price - (usd_risk * rval)) / order_size
  stop_loss = (total_usd_price + usd_risk) / order_size
else
  exit_price = (total_usd_price + (usd_risk * rval)) / order_size
  stop_loss = (total_usd_price - usd_risk) / order_size
end
profit = rval * usd_risk

puts "Total Usd  :: %.2f \n" % total_usd_price
puts "Stop Loss  :: %.2f \n" % stop_loss
puts "Exit price :: %.2f \n" % exit_price
puts "Profit     :: %.2f \n" % profit
