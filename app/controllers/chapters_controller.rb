class ChaptersController < ApplicationController
  after_action :authorize_chapter
  before_action :set_chapter, only: %i[show edit update destroy]
  before_action :set_subject, only: %i[new create show]

  def show
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.subject = @subject
    if @chapter.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @chapter.update(chapter_params)
      redirect_to subject_path(@chapter.subject)
    else
      render :edit
    end
  end

  def destroy
    # ! INSERT AN IF TO CHECK FOR POTENTIAL ERROS
    redirect_to subject_path(@chapter.subject) if @chapter.destroy
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :subject_id)
  end

  def authorize_chapter
    authorize @chapter
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end
end
