require './method'


# 自動売買プログラム
while(1)
  current_price = get_price
  puts current_price

  buy_price = 990000
  sell_price = 992000
  if (current_price > sell_price) && (get_balance("BTC")["amount"] >= 0.001)
    puts "売ります"
    order("SELL", sell_price, 0.001)
  elsif (current_price < buy_price) && (get_balance("JPY")["amount"]) > 1000
    puts "買います"
    order("BUY", buy_price, 0.001)
  else
    puts "現状維持"
  end

  sleep(1)
end
