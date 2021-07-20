# Scraper Seeds
parts = [Ssd, Hdd, CaseFan, Case, CpuFan, Cpu, Gpu, Mobo, Psu, Ram]

parts.each do |part|
  Scraper.process(part)
end
