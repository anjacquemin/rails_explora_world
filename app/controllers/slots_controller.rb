class SlotsController < ApplicationController
  def show
    @slot = Slot.find(params[:id])
    authorize @slot
  end
end
