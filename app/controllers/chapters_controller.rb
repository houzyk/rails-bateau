class ChaptersController < ApplicationController
  def index

  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @chapter = Chapter.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def chapter_params

  end
end
