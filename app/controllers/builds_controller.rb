class BuildsController < ApplicationController
  # before_action :authenticate_user!

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
    @cpu_fans = CpuFan.all
  end

  def index
    @cpus = Cpu.all
    @mobos = Mobo.all
    @cpu_fans = CpuFan.all
    @gpus = Gpu.all
    @rams = Ram.all
    @hdds = Hdd.all
    @ssds = Ssd.all
    @cases = Case.all
    @psus = Psu.all
    @case_fans = CaseFan.all
  end

  def show
    @cpus = Cpu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cpus }
    end

    @mobos = Mobo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mobos }
    end
  end

  def new
    @build = Build.new
    @build_cpu = @build.cpus.build
    @build_cpu_fan = @build.cpu_fans.build
    @build_case_fans = @build.build_case_fans.build
    @build_gpu = @build.build_gpus.build
    @build_hdd = @build.build_hdds.build
    @build_ram = @build.build_rams.build
    @build_ssd = @build.build_ssds.build
    
  end

  def create
    @build = Build.new(build_params)

    if @build.save
      redirect_to root_path, notice: 'Build Successfully Created'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def build_params
    params.require(:build).permit(:name, :purpose, :user_id, :cpu_id, :mobo_id, :psu_id, :case_id, :cpu_fan_id,
                                  build_cpus_attributes: %i[id cpu_id],
                                  build_mobos_attributes: %i[id mobo_id],
                                  build_cpu_fans_attributes: %i[id cpu_fan_id],
                                  build_gpus_attributes: %i[id gpu_id],
                                  build_rams_attributes: %i[id ram_id],
                                  build_hdds_attributes: %i[id hdd_id],
                                  build_ssds_attributes: %i[id ssd_id],
                                  build_cases_attributes: %i[id case_id],
                                  build_psus_attributes: %i[id psu_id],
                                  build_case_fans_attributes: %i[id case_fan_id])
  end
end
