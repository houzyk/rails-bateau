class RoomsController < ApplicationController
  def show
    # @rooms = Room.all
    # unless @rooms.empty?

    # else

    # end
    @room = Room.find(params[:id])
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
    # set_chatroom
    # @room = Room.new
    # authorize @room
    # raise
    create
  end

  def create
    set_chatroom
    @rooms = Room.all
    unless @rooms.empty?
      @user_videoroom = @rooms.select do |room|
        room.name == @chatroom.name
      end
      raise
    else
      @room = Room.new(name: @chatroom.name)
      respond_to do |format|
        if @room.save
          format.html { redirect_to chatroom_room_path(@chatroom, @room) }
          format.json { render :show, status: :created, location: @room }
        else
          render :new
        end
      end
    end
    authorize @room
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to root_path
    authorize @room
  end

  # Custom methods


  private

  def room_params
    params.require(:room).permit(:name)
  end

    def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
