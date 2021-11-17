class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @subjects = Subject.all
    @schedules = Schedule.all
  end

  def campus
    @users = User.all
  end
end
