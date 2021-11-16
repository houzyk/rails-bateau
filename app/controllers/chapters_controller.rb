class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find(params[:chapter_id])
    authorize @chapter
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @chapter = Chapter.new
    authorize @chapter
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @subject = Subject.find(params[:subject_id])
    @chapter.subject = @subject
    if @chapter.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
    authorize @chapter
  end

  def edit
    @chapter = Chapter.find(params[:id])
    authorize @chapter
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(chapter_params)
    redirect_to subject_path(@chapter.subject)
    authorize @chapter
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to subject_path(@chapter.subject)
    authorize @chapter
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :subject_id)
  end
end
