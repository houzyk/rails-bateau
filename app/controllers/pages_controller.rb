class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @subjects = Subject.all
    @schedules = Schedule.all
  end

  def campus
    # @users = User.all
    @users = User.except(@current_user)
    @students = @users.where(teacher: false)
    @count_students = @students.count
    @teachers = @users.where(teacher: true)
    @count_teachers = @teachers.count
    # @current_user = current_user
    # @rooms = Room.public_rooms
    # @users = User.all_except(@current_user)

    # ! NEW
    # @user = User.find(params[:id])
    @current_user = current_user
    @rooms = Chatroom.public_rooms
    @room = Chatroom.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Chatroom.where(name: @room_name).first || Chatroom.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
  end

  private

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
