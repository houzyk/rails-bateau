class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[edit update destroy]
  after_action :authorize_schedule, except: :index

  def index
    @schedules = policy_scope(Schedule)
    if params[:query].present?
      @schedules = @schedules.search_by_content(params[:query])
    else
      @schedules
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user = current_user
    if @schedule.save
      redirect_to schedules_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @schedule.update(schedule_params)
    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:content, :date, :public)
  end

  def authorize_schedule
    authorize @schedule
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
