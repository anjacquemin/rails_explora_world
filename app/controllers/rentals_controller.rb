class RentalsController < ApplicationController
  def create
    @slot = Slot.find(params[:slot_id])
    @user = current_user
    @rental = Rental.new
    @rental.user = @user
    @rental.slot = @slot
    @rental.save!
    authorize @rental
    redirect_to dashboard_booking_path(@rental)
  end
end
