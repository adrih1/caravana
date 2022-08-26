class BookingsController < ApplicationController
  before_action :skip_authorization

  def new
    @booking = Booking.new
    @van = Van.find(params[:van_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @van = Van.find(params[:van_id])
    @booking.user = current_user
    @booking.van = @van
    if @booking.save
      sleep 2
      redirect_to dashboard_path(@van)
    else
      render 'vans/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other, notice: "🚨 Booking was succesfully deleted 🚨"
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
