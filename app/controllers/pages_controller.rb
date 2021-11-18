class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @subjects = Subject.all
    @schedules = Schedule.all
  end

  def campus
    @users = User.all
    @students = @users.where(teacher: false)
    @count_students = @students.count
    @teachers = @users.where(teacher: true)
    @count_teachers = @teachers.count
  end
  
    
end
