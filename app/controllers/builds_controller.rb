require 'byebug'
class BuildsController < ApplicationController
  # before_action :authenticate_user!

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

  # def show
  #   @cpus = Cpu.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @cpus }
  #   end

  #   @mobos = Mobo.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @mobos }
  #   end
  # end

  def new
    @build = Build.new
    @build_case_fans = @build.build_case_fans.build
    @build_gpus = @build.build_gpus.build
    @build_hdds = @build.build_hdds.build
    @build_rams = @build.build_rams.build
    @build_ssds = @build.build_ssds.build

    #computer parts#
    @cpu = Cpu.find(params[:cpu_id])
    @mobo = Mobo.find(params[:mobo_id])
    @ram = Ram.find(params[:ram_id])
    @ssd = Ssd.find(params[:ssd_id])
    @hdd = Hdd.find(params[:hdd_id])
    @gpu = Gpu.find(params[:gpu_id])
    @psu = Psu.find(params[:psu_id])
    @case = Case.find(params[:case_id])
    @case_fan = CaseFan.find(params[:case_fan_id])
    @cpu_fan = CpuFan.find(params[:cpu_fan_id])
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
    params.require(:build).permit(:name, :purpose, :user_id, :cpu_id, :mobo_id, :psu_id, :case_id, :cpu_fan_id, :total_price,
                                  build_gpus_attributes: %i[id gpu_id],
                                  build_rams_attributes: %i[id ram_id],
                                  build_hdds_attributes: %i[id hdd_id],
                                  build_ssds_attributes: %i[id ssd_id],
                                  build_case_fans_attributes: %i[id case_fan_id])
  end
end
