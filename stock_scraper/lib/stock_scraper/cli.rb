class StockScraper::CLI
  def call
    list_stocks
  end
  def list_stocks
    puts " "
    puts "Here are the biggest mover's in the market today:"
    @stocks = StockScraper::Stock_Find.today
    @stocks.each.with_index(1) do |equity, i|
      puts"#{i}.#{equity.company}(#{equity.ticker}) - $#{equity.price}/#{equity.per_change}%".ljust(15)
    end
  end
end
