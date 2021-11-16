class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id, :user_id)
  end
end
