class BookingsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_device, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user.id
    @booking.device = @device
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_device
    @device = Device.find(params[:device_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :device_id, :start_date, :end_date, :cost)
  end
end
