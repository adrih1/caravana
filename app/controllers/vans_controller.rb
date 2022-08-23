class VansController < ApplicationController
  def index
    @vans = policy_scope(Van)
  end

  # GET /van/1
  def show
    @van = Van.find(params[:id])
    @booking = Booking.new
    #@review = Review.new
    authorize @van
  end

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
      redirect_to van_path(@van), flash: { notice: "Successfully created" }
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
    authozie @van
    @van.destroy
    redirect_to vans_path, status: :see_other
  end

  private

  def van_params
    params.require(:van).permit(:description, :color, :location, :price_per_day, :brand, :mileage)
  end

end

