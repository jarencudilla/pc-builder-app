class PartsController < ApplicationController

  def cpu
    @cpus = Cpu.all
  end

  def mobo
    @cpu = Cpu.find(params[:cpu_id])
    @mobos = Mobo.where(socket_cpu: @cpu.socket)
  end

  def ram
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @rams = Ram.all
  end

  def ssd
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssds = Ssd.all
  end

  def hdd
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdds = Hdd.all
  end

  def gpu
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpus = Gpu.all
  end

  def psu
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpu = Gpu.find(params[:gpu_id])
    @psus = Psu.all
  end

  def case
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpu = Gpu.find(params[:gpu_id])
    @psu = Psu.find(params[:psu_id])
    @cases = Case.all
  end

  def case_fan
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpu = Gpu.find(params[:gpu_id])
    @psu = Psu.find(params[:psu_id])
    @case = Case.find(params[:case_id])
    @case_fans = CaseFan.all
  end

  def cpu_fan
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpu = Gpu.find(params[:gpu_id])
    @psu = Psu.find(params[:psu_id])
    @case = Case.find(params[:case_id])
    @case_fan = CaseFan.find(params[:case_fan_id])
    @cpu_fans = CpuFan.all
  end
end
