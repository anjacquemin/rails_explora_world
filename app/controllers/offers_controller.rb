class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = policy_scope(Offer).search_by_city(params[:query])
    else
      @offers = policy_scope(Offer).all
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end
  # map
end
