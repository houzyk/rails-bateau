class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @subjects = Subject.all
    @schedules = policy_scope(Schedule).order(date: :asc)
  end

  def campus
    @users = User.all
    @users = @users.campus_search(params[:query]) if params[:query].present?
    @students = @users.where(teacher: false)
    @teachers = @users.where(teacher: true)
    @count_students = @students.count
    @count_teachers = @teachers.count
  end
end
