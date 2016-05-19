require 'money'
I18n.config.available_locales = :en

curr = {
  :priority        => 1,
  :iso_code        => "ETH",
  :name            => "Ethereum",
  :symbol          => "Ξ",
  :subunit         => "Finney",
  :subunit_to_unit => 1000,
  :separator       => ".",
  :delimiter       => ","
}

Money::Currency.register(curr)

rval = 2.7                                  # Risk multiplier to determine profit
market_price = Money.new(1415, "USD")       # Current market price / buy in pice
Money.add_rate("USD", "ETH", market_price)

order_size = 6                           # Number of ETH to buy
usd_risk = Money.new(50, "USD")
short = true

total_usd_price = order_size * market_price

if(short)
  short_txt = "<= Short Sale =>"
  exit_price = (total_usd_price - (usd_risk * rval)) / order_size
  stop_loss = (total_usd_price + usd_risk) / order_size
else
  short_txt = "<= Regular Buy =>"
  exit_price = (total_usd_price + (usd_risk * rval)) / order_size
  stop_loss = (total_usd_price - usd_risk) / order_size
end
profit = rval * usd_risk

puts "\n" + short_txt + "\n"
puts "<------------------------------>"
puts "  Buy in     :: #{market_price} \n"
puts "  Stop Loss  :: #{stop_loss} \n"
puts "  Exit price :: #{exit_price} \n"
puts " -----------------------------"
puts "  Total Usd in Use    :: #{total_usd_price} \n"
puts "  Total Risk          :: #{usd_risk} \n"
puts "  Possible Profit     :: #{profit} \n"
puts "<------------------------------>\n\n"
