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
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def product_params
    params.require(:build).permit(:name, :purpose, :total_price)
  end
end
