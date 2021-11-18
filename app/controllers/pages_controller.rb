class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @subjects = Subject.all
    @schedules = Schedule.all
  end

  def campus
    @users = User.except(@current_user)
    @students = @users.where(teacher: false)
    @count_students = @students.count
    @teachers = @users.where(teacher: true)
    @count_teachers = @teachers.count

    if params[:query].present?
      @users = User.campus_search(params[:query])
    else
      @users = User.all
    end
  end
end
