class StockScraper::Stock_Find
  attr_accessor :ticker, :url
  def initialize(ticker = nil, url = nil)
    @ticker = ticker
    @url = url
  end
  def self.all
    @@all ||= stock_scrape
  end
  def self.stock_scrape
    doc = Nokogiri::HTML(open("https://www.marketwatch.com/"))
    stock = doc.search("a.list__item")
    stock.collect{|t| new(t.search('span.mover__symbol').text, t.attribute('href'))}
  end
end
