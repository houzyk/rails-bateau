class SchedulesController < ApplicationController

  def index
    @schedules = policy_scope(Schedule)
  end

  def new
    @schedule = Schedule.new
    authorize @schedule
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      render :new
    end
    authorize @schedule
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def schedule_params
    params.require(:schedule).permit(:content, :date)
  end

end
