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
      redirect_to dashboard_path(@van), notice: "Booking was successfully created."
    else
      render 'vans/show', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking.destroy
    redirect_to root_path, status: :see_other, notice: "Booking was succesfully deleted, hope to see you soon"
  end
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
