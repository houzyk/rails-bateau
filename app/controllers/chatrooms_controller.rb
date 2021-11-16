class ChatroomsController < ApplicationController
  def index
    @restaurants = policy_scope(Chatroom)
  end
  
  def show
  end
end