class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @rentals = Rental.where(user_id: current_user.id)
    # @slots= Slot.where(rental_
    @pastvisit = @rentals.map { |rental| rental.slot if rental.slot.start_at < Date.today }.compact
    @markers = []
    @rentals.each do |rental|
      @markers <<
        {
          lat: rental.slot.offer.latitude,
          lng: rental.slot.offer.longitude
        }
    end
  end

  def dashboard_booking
    @user = current_user
    @rentals = Rental.where(user_id: current_user.id)
    @last_rental = Rental.find(params[:id])
    @markers = []
    @rentals.each do |rental|
      @markers <<
        {
          lat: rental.slot.offer.latitude,
          lng: rental.slot.offer.longitude
        }
    end
    render :dashboard
  end
end
