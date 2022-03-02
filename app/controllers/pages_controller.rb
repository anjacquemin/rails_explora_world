class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @rentals = Rental.where(user_id: current_user.id)
  end

  def dashboard_booking
    @user = current_user
    @rentals = Rental.where(user_id: current_user.id)
    @last_rental = Rental.find(params[:id])
    render :dashboard
  end
end
