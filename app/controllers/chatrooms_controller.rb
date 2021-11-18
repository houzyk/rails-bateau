class ChatroomsController < ApplicationController
  after_action :authorize_chatroom, except: :index

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @users = User.all
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :index
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def authorize_chatroom
    authorize @chatroom
  end
end
