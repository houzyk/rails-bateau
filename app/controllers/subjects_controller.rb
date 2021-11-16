class SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject)
  end

  def show
    @subject = Subject.find(params[:id])
    authorize @subject
  end

  def new
    @subject = Subject.new
    authorize @subject
  end

  def create
    @subject = Subject.new(subject_params)
    # @category = Category.find(params[:category_id])
    # @subject.category = @category
    if @subject.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
    authorize @subject
  end

  def edit
    @subject = Subject.find(params[:id])
    authorize @subject
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render :edit
    end
    authorize @subject
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to subjects_path
    authorize @subject
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description, :category_id)
  end
end
