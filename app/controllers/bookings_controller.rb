class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
