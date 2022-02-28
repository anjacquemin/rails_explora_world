class RentalsController < ApplicationController
  def create
    @slot = Slot.find(params[:slot_id])
    @user = current_user
    @rentals = Rental.new
    @rentals.user = @user
    @rentals.slot = @slot
    @rentals.save!
    redirect_to dashboard_path()
  end
end
