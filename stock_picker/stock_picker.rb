# frozen_string_literal: true

def stock_picker(stocks)
  bestArr = []
  min = stocks[0] - stocks[1]
  stocks.each_with_index do |day, index1|
    stocks[stocks.index(day)..].each do |sellDay|
      if day - sellDay < min
        min = day - sellDay
        bestArr = [index1, stocks.index(sellDay)]
      end
    end
  end
  bestArr
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
