class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def show
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to device_path(@device)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @device.update(device_params)
      redirect_to device_path(@device)
    else
      render :new
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  private

  def set_device
    @device = Device.find(params[:device_id])
  end

  def device_params
    params.require(:device).permit(:name, :description, :brand, :model, :category, :price, :is_rented, :owner_id)
  end
end
