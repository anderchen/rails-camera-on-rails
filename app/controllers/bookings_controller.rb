class BookingsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_device, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id).order(created_at: :desc)
    @owner_bookings = policy_scope(Device).where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    start_date = @booking.start_date.to_date
    end_date = @booking.end_date.to_date
    @booking.cost = [1, ((end_date - start_date).to_i)].max * @device.price

    @booking.device = @device

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @device, :new_booking?
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
