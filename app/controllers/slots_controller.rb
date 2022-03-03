class SlotsController < ApplicationController
  def show
    @slot = Slot.find(params[:id])
    authorize @slot

    # FOR VIDEO HANDLING
    @user = @slot.user #In theroy, in our case it is the guide
    p @user
    setup_video_call_token

    #Chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new()
  end

  private

  #FOR VIDEO HANDLING
  def setup_video_call_token
    # No chatting with yourself
    p "VIDEO CALL TOKEN SETUP"
    p "current user = #{current_user.first_name} #{current_user.last_name}"
    p "guide = #{ @slot.user.first_name} #{ @slot.user.last_name}"

    # return if @user == current_user

    twilio = TwilioService.new
    # twilio.generate_token(current_user, @user)
    twilio.generate_token(@slot, @user)
    @twilio_jwt = twilio.jwt
    p "AFTER TOKEN GENERATION"
    p "twilio jwr : #{@twilio_jwt}"
    @room_id = twilio.room_id
    p "room_id #{@room_id}"
  end


end
