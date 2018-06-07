class StockScraper::Stock_Find
  attr_accessor :ticker, :company, :price, :per_change
  def self.today
    self.stock_scrape
  end
  def self.scrape
    stocks = []
    stocks << self.stock_scrape
  end
  def self.stock_scrape
    stocks1 = self.new
    stocks1.ticker = "FB"
    stocks1.company = "Facebook"
    stocks1.price = 198
    stocks1.per_change = 56

    stocks2 = self.new
    stocks2.ticker = "AAPL"
    stocks2.company = "Aaple, Inc."
    stocks2.price = 197
    stocks2.per_change = 47
    [stocks1, stocks2]
  end
end
