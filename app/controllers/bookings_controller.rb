class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking.destroy
    redirect_to root_path, status: :see_other, notice : "Booking was succesfully deleted, hope to see you soon"
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
