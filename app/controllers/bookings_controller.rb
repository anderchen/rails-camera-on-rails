class BookingsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.device = @device
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_device
    @device = Device.find(params[:device_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cost)
  end
end
