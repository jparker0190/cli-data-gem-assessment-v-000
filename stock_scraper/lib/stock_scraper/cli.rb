class StockScraper::CLI
  def call
    list_stocks
    instructions
    goodbye
  end
  def list_stocks
    puts " "
    puts "Here are the biggest mover's in the market today:"
    @stocks = StockScraper::Stock_Find.today
    @stocks.each.with_index(1) do |equity, i|
      puts"#{i}.#{equity.company}(#{equity.ticker}) - $#{equity.price}/#{equity.per_change}%".ljust(15)
    end
  end
  def instructions
    input = nil
    while input != "cya"
      puts "Enter the stock that you would like more information about. i.e. (1, 2, etc.)"
      input = gets.strip.downcase
      if input.to_i > 0
        stock_pick = @stocks[input.to_i-1]
        puts"#{stock_pick.company} - #{stock_pick.ticker} - #{stock_pick.price}"
      elsif input == "list"
        list_stocks
      else
        puts "You didn't pick a good command. Try again."
      end
    end
  end
  def goodbye
    puts "Cya lata!!!"
  end
end
