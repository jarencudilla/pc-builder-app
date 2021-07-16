class CpuFan < ApplicationRecord
  has_many :builds, dependent: :destroy

  def self.name
    @name = 'cpu_fans'
  end

  def self.url
    @start_urls = ["https://pangoly.com/en/browse/cpu-cooler?page=#{@page}"]
  end

  def self.parse_repo_page(response)
    puts('getting info')
    item = {}
    @table = response.xpath("//table[@class='table table-bordered table-striped table-hover']/tbody")
    item[:fan_rpm] = self.get_text('Fan RPM')
    item[:noise_level] = self.get_text('Noise Level')
    item[:radiator_size] = self.get_text('Radiator Size')
    item[:supported_sockets] = self.get_arr('Supported Sockets')
    item[:price] = response.xpath("//span[@class='price']").text.tr('^0-9.', '').to_f
    byebug
    self.find_or_create_by(item)
  end

  def self.get_text(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.text.squish
  end

  def self.get_int(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.text.squish.to_i
  end

  def self.get_arr(column)
    info = @table.css('tr').xpath("//strong[text()='#{column}']").xpath('..').xpath('..').css('td')[1]
    return nil unless info
    return info.css('ul/li').map{ |item| item.text }
  end

end
