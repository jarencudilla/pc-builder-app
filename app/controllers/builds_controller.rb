class BuildsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @cpus = Cpu.all
    @mobos = Mobo.all
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
      build_case_fans_attributes: [:id, :case_fan_id],
      build_gpus_attributes: [:id, :gpu_id],
      build_hdds_attributes: [:id, :hdd_id],
      build_rams_attributes: [:id, :ram_id],
      build_ssds_attributes: [:id, :ssd_id],
    )
  end
end
