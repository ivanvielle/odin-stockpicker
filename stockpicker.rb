# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#

def stock_picker(prices)
  trades = {}
  # combine every 2 array elements then convert them to array
  price_pairs = prices.combination(2).to_a

  price_pairs.map {|pair| 
    profit = pair.reduce {|acc,curr| curr - acc}
    if profit > 0
      trades[pair] = profit
    end
  }

  profitable_pair = trades.max_by {|key,value| value}
  buy_day = prices.find_index(profitable_pair[0][0]) + 1
  sell_day = prices.find_index(profitable_pair[0][1]) + 1
  profit = profitable_pair[1]

  p "Best day to BUY is DAY #{buy_day}, best day to SELL is DAY #{sell_day} for a PROFIT of $#{profit}"
end

stock_picker([17,3,6,9,15,8,6,1,10])