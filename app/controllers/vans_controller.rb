class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index

    @markers = @vans.geocoded.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude
      }
    end
  end

  # GET /van/1
  def show
    @van = Van.find(params[:id])
    @booking = Booking.new
    authorize @van
    if @van.geocode
      @marker = [lat: @van.geocode[0], lng: @van.geocode[1], image_url: helpers.asset_path("logo.png")]
    end
  end
  #/Users/imaginarium/code/Kenbak/caravana/app/assets/images/logo.png
  # GET /van/new
  def new
    @van = Van.new
    authorize @van
  end

  # GET /van/1/edit
  def edit
    @van = Van.find(params[:id])
    authorize @van
  end

  # POST /van
  def create
    @van = Van.new(van_params)
    @van.user = current_user
    @van.save
    if @van.save
      sleep 2
      redirect_to van_path(@van)
    else
      render :new, status: :unprocessable_entity
    end
      authorize @van
  end

  def update
    authorize @van
    if @van.update(van_params)
      redirect_to van_path(@van)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @van
    @van.destroy
    redirect_to vans_path, status: :see_other
  end

  private

  def van_params
    params.require(:van).permit(:title, :capacity, :description, :color, :location, :price_per_day, :brand, :mileage, photos:[])
  end
end
