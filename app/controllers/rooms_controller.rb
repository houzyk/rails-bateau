class RoomsController < ApplicationController
  def show
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    unless @room.room_sid.present?
      # create room in twilio
      twilio_room = @client.video.rooms.create(type: 'peer-to-peer', unique_name: @room.unique_name)
      @room.update(room_sid: twilio_room.sid)
    end
    identity = (0...5).map { ('a'..'z').to_a[rand(26)] }.join
    @room_name = @room.unique_name

    # create token to access Twilio room
    @token = Twilio::JWT::AccessToken.new(ENV['ACCOUNT_SID'], ENV['API_KEY_SID'], ENV['API_KEY_SECRET'], identity: identity)

    # create video grant for token
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = @room_name

    @token.add_grant grant
    @token = @token.to_jwt
    authorize @room
  end

  def new
    authorize @room
  end

  def create
    authorize @room
  end

  def destroy
    authorize @room
  end
end
