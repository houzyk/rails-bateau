class ChatroomsController < ApplicationController
  def index
    @restaurants = policy_scope(Chatroom)
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
