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
          lng: rental.slot.offer.longitude,
          image_url: helpers.asset_url("marker.png")
        }
    end
    @offers = Offer.all
    @museums_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Museum" }.select { |rental| rental.slot.start_at < Date.today }.count
    @monuments_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Monument" }.select { |rental| rental.slot.start_at < Date.today }.count
    @neighborhoods_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Neighborhood" }.select { |rental| rental.slot.start_at < Date.today }.count

    @museums = Offer.all.select { |offer| offer.category.name == "Museum" }
    @monuments = Offer.all.select { |offer| offer.category.name == "Monument" }
    @neighborhoods = Offer.all.select { |offer| offer.category.name == "Neighborhood" }
  end

  def dashboard_guide
    @user = current_user
    @offers = Offer.where(user_id: current_user.id)
    @rentals = Rental.all.select {|rental| rental.slot.offer.user == current_user}
    @pastvisit = @rentals.map { |rental| rental.slot if rental.slot.start_at < Date.today }.compact
    # @slots= Slot.where(rental_
    # @pastvisit = @rentals.map { |rental| rental.slot if rental.slot.start_at < Date.today }.compact
  end

  # def dashboard_booking
  #   @user = current_user
  #   @rentals = Rental.where(user_id: current_user.id)
  #   @last_rental = Rental.find(params[:id])
  #   @pastvisit = @rentals.map { |rental| rental.slot if rental.slot.start_at < Date.today }.compact
  #   @markers = []
  #   @rentals.each do |rental|
  #     @markers <<
  #       {
  #         lat: rental.slot.offer.latitude,
  #         lng: rental.slot.offer.longitude,
  #         image_url: helpers.asset_url("marker.png")
  #       }
  #   end
  #   @offers = Offer.all
  #   @museums_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Museum" }.select { |rental| rental.slot.start_at < Date.today }.count
  #   @monuments_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Monument" }.select { |rental| rental.slot.start_at < Date.today }.count
  #   @neighborhoods_visited = current_user.rentals.select { |rental| rental.slot.offer.category.name == "Neighborhood" }.select { |rental| rental.slot.start_at < Date.today }.count

  #   @museums = Offer.all.select { |offer| offer.category.name == "Museum" }
  #   @monuments = Offer.all.select { |offer| offer.category.name == "Monument" }
  #   @neighborhoods = Offer.all.select { |offer| offer.category.name == "Neighborhood" }
  #   render :dashboard
  # end
end
