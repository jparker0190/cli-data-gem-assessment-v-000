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
    doc = Nokogiri::HTML(open("https://www.marketwatch.com/"))
    stock = self.new
    stock.ticker = doc.search("span.mover__symbol").text.strip
    binding.pry
  end
end
