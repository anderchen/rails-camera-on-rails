class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all
    @devices = policy_scope(Device).order(created_at: :desc)
  end

  def show
  end

  def new
    @device = Device.new
    authorize @device
  end

  def edit
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    if @device.save
      redirect_to device_path(@device)
    else
      render :new
    end
    authorize @device
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
    @device = Device.find(params[:id])
    authorize @device
  end

  def device_params
    params.require(:device).permit(:name, :description, :brand, :model, :category, :price, :is_rented, :owner_id, :photo)
  end
end
