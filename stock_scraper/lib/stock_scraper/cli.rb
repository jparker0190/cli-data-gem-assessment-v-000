class StockScraper::CLI
  def call
    list_stocks
    instructions
  end
  def list_stocks
    puts ""
    puts "Here are the most active stocks in the S&P:"
    puts ""
    @stocks = StockScraper::Stock_Find.all
    @stocks.each.with_index(1).reverse.drop(1).reverse do |equity, i|
      puts"#{i}. #{equity.ticker}"
    end
  end
  def instructions
    input = nil
    while input != "cya"
      puts""
      puts "Enter a number for more information or type cya to leave app."
      input = gets.strip.downcase
      if input.to_i > 0
        stock_pick = @stocks[input.to_i-1]
        puts""
        puts"You can click on the link beside the ticker to be taken to the stock's website on marketwatch.com"
        puts ""
        puts"#{stock_pick.ticker} - #{stock_pick.url}"
      elsif input == "list"
        list_stocks
      elsif input == "cya"
        goodbye
      else
        puts "You didn't pick a good command. Try again."
      end
    end
  end
  def goodbye
    puts "Later!!"
  end
end
