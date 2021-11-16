class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @users = User.all
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
