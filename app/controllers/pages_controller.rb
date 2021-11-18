class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @subjects = Subject.all
    @schedules = Schedule.all
  end

  def campus
    @users = User.except(@current_user)
    if params[:query].present?
      @users = @users.campus_search(params[:query])
      @students = @users.where(teacher: false)
      @count_students = @students.count
      @teachers = @users.where(teacher: true)
      @count_teachers = @teachers.count
    else
      @students = @users.where(teacher: false)
      @count_students = @students.count
      @teachers = @users.where(teacher: true)
      @count_teachers = @teachers.count
    end
  end
end
