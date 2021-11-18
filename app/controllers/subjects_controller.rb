class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]
  after_action :authrozie_subject, except: :index

  def index
    if params[:query].present?
      @subjects = policy_scope(Subject).subject_search("#{params[:query]}")
    else
      @subjects = policy_scope(Subject)
    end
  end

  def show; end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description, :category_id)
  end

  def authrozie_subject
    authorize @subject
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
