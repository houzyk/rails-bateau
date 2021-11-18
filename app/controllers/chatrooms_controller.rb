class ChatroomsController < ApplicationController
  after_action :authorize_chatroom, except: %i[index new create]

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @users = User.all
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  def new
    create
  end

  def create
    @user = User.find(params[:format])
    @current_user = current_user
    @rooms = Chatroom.public_rooms
    @room = Chatroom.new
    @room_name = get_name(@user, @current_user)
    @single_room = Chatroom.where(name: @room_name).first || Chatroom.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
    redirect_to chatroom_path(@single_room)
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
