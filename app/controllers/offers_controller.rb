class OffersController < ApplicationController
  def index
    @amazonia = Offer.select { |offer| offer.title == "Amazonia" }
    @id = @amazonia[0].id
    if params[:query].present?
      @offers = policy_scope(Offer).search_by_city(params[:query])
    else
      @offers = policy_scope(Offer).all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        image_url: helpers.asset_url("marker.png")
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
        lng: @offer.longitude,
        image_url: helpers.asset_url("marker.png")
      }
    ]
    end
  end

  def new
    @offer = Offer.new
    authorize @offer

  end

  def create
    @offer = Offer.new(check_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to dashboard_guide_path()
    else
      render 'new'
    end
  end

  private

  def check_params
    params.require(:offer).permit(:address, :description, :video_type, :category_id, :city, :title, :price, photos: [])
  end

end
