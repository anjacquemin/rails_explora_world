class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = policy_scope(Offer).search_by_city(params[:query])
    else
      @offers = policy_scope(Offer).all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    if @offer.geocoded?
    @markers = [
      {
        lat: @offer.latitude,
        lng: @offer.longitude
      }
    ]
    end
  end

  # map
end
