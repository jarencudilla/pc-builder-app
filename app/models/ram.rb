class Ram < ApplicationRecord
  has_many :build_rams, dependent: :destroy
  has_many :builds, through: :build_rams

  def self.name
    @name = 'rams'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/ram?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:speed] = get_text('Speed')
    item[:latency] = get_int('CAS Latency')
    item[:color] = get_text('Color')
    item[:memory_type] = get_text('Type')
    item[:memory_size] = get_text('Size')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    byebug
    find_or_create_by(item)
  end

  def self.get_text(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.text.squish
  end

  def self.get_int(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.text.squish.to_i
  end

  def self.get_arr(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info

    info.css('ul/li').map(&:text)
  end
end
