class ChatroomsController < ApplicationController
  after_action :authorize_chatroom, except: %i[index new create video]

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    user_chatrooms = @chatrooms.select do |chatroom|
      chatroom.participants.any? do |participant|
        participant.user_id == current_user.id
      end
    end
    @chatrooms_count = user_chatrooms.count
  end

  def show
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  def new
    create
  end

  def create
    @user = User.find(params[:user])
    @current_user = current_user
    @rooms = Chatroom.public_rooms
    @room = Chatroom.new
    @room_name = get_name(@user, @current_user)
    @single_room = Chatroom.where(name: @room_name).first || Chatroom.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
    redirect_to chatroom_path(@single_room)
    authorize @single_room
  end

  def video
    @user = User.find(params[:user])
    @current_user = current_user
    @rooms = Chatroom.public_rooms
    @room = Chatroom.new
    @room_name = get_name(@user, @current_user)
    @single_room = Chatroom.where(name: @room_name).first || Chatroom.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages

    @rooms = Room.all
    unless @rooms.empty?
      @room = @rooms.select do |room|
        room.name == @single_room.name
      end
      redirect_to chatroom_room_path(@single_room, @room)
    else
      @room = Room.new(name: @single_room.name)
      respond_to do |format|
        if @room.save
          format.html { redirect_to chatroom_room_path(@single_room, @room) }
          format.json { render :show, status: :created, location: @room }
        else
          render :new
        end
      end
    end
    authorize @single_room
  end


  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def authorize_chatroom
    authorize @chatroom
  end

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
