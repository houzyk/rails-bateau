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
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to schedules_path
    authorize @schedule
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    authorize @schedule
  end

  private

  def schedule_params
    params.require(:schedule).permit(:content, :date, :public)
  end
end
