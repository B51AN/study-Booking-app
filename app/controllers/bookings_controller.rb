class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = current_user.bookings.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:room_number, :subject)
  end
end
