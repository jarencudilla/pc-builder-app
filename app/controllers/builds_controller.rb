class BuildsController < ApplicationController
  # before_action :authenticate_user!

  # def index
  #   @builds = Build.all
  # end

  def cpu
    @cpus = Cpu.all
  end

  def mobo
    @mobos = Mobo.all
  end

  def case
    @cases = Cases.all
  end

  def gpu
    @gpus = Gpu.all
  end

  def hdd
    @hdds = Hdd.all
  end

  def psu
    @psus = Psu.all
  end

  def ram
    @rams = Ram.all
  end

  def ssd
    @ssds = Ssd.all
  end

  def case_fan
    @case_fans = Case_fan.all
  end

  def cpu_fan
    @cpu_fans = Cpu_fan.all
  end
end
