require 'kimurai'
require 'webdrivers'

Kimurai.configure do |config|
  config.selenium_firefox_path = ENV["FIREFOX_BIN"].presence || "/usr/bin/firefox-browser"
end

class Scraper < Kimurai::Base
  @engine = :selenium_firefox
  @config = { before_request: {
    delay: 2..4
  } }
  @@page = 1

  def self.process(model)
    @@class = model
    @name = @@class.name
    @page = @@page
    @start_urls = @@class.url
    crawl!
  end

  def parse(response, url:, data: {})
    products = response.xpath("//a[contains(@class, 'productItemLink')]")

    return unless products.any?

    products.each do |a|
      request_to :parse_repo_page, url: absolute_url(a[:href], base: url)
    end
    @@page += 1
    request_to :parse, url: absolute_url((@@class.url.first + @@page.to_s), base: url)
  end

  def parse_repo_page(response, url:, data: {})
    @@class.parse_repo_page(response)
  end
end
