class MaterialsController < ApplicationController
  # after_action :authorize_material
  # def show
  #   @material = Material.find(params[:material_id])
  #   authorize @material
  # end

  def new
    @subject = Subject.find(params[:subject_id])
    @chapter = Chapter.find(params[:chapter_id])
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.new(material_params)
    @subject = Subject.find(params[:subject_id])
    @chapter = Chapter.find(params[:chapter_id])
    @material.chapter = @chapter
    if @material.save
      redirect_to subject_chapter_path(@subject, @chapter)
    else
      render :new
    end
    authorize @material
  end

  def edit
    @material = Material.find(params[:id])
    authorize @material
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to subject_chapter_path(@material.chapter.subject, @material.chapter)
    else
      render :edit
    end
    authorize @material
  end

  def destroy
    @material = Material.find(params[:id])
    # ! INSERT AN IF TO CHECK FOR POTENTIAL ERROS
    redirect_to subject_chapter_path(@material.chapter.subject, @material.chapter) if @material.destroy
    authorize @material
  end

  private

  def material_params
    params.require(:material).permit(:name, :subject_id, :chapter_id)
  end

  # def authorize_material
  #   authorize @material
  # end
end
