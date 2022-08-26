class PagesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  skip_before_action :authenticate_user!, only: :home

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def home
    if params[:query].present?
      @vans = Van.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @vans = Van.all
    end
  end

  def error
  end

  def dashboard
   # @bookings = Booking.find_by user_id: current_user.id
    @bookings = current_user.bookings
  end

  def my_vans
    @vans = current_user.vans
  end
end
