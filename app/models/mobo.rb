class Mobo < ApplicationRecord
  has_many :builds, dependent: :destroy

  def self.name
    @name = 'mobos'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/motherboard?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:socket_cpu] = get_text('Socket')
    item[:form_factor] = get_text('Form factor')
    item[:max_memory] = get_text('Maximum Supported RAM')
    item[:memory_slots] = get_text('RAM Slots')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    item[:name] = response.xpath("//div[contains(@class, 'product-info')]").css('h2').text
    item[:image] = response.xpath("//img[@class='nivo-main-image']").attr('src').value
    item[:supported_memory] = []
    response.xpath("//div[@class='ram-values text-left']/span").each do |speed|
      ddr = get_text('Supported Memory').tr(':', '-').split.first
      speed = speed.text.squish
      item[:supported_memory].push(ddr + speed)
    end
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
