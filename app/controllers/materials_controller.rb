class MaterialsController < ApplicationController
  after_action :authorize_material
  before_action :set_material, only: %i[edit update destroy]
  before_action :set_subject_chapter, only: %i[new create]

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.chapter = @chapter
    if @material.save
      redirect_to subject_chapter_path(@subject, @chapter, anchor:"topic-#{@material.id}")
    else
      render :new
    end
  end

  def edit; end

  def update
    if @material.update(material_params)
      redirect_to subject_chapter_path(@material.chapter.subject, @material.chapter , anchor:"topic-#{@material.id}")
    else
      render :edit
    end
  end

  def destroy
    # ! INSERT AN IF TO CHECK FOR POTENTIAL ERROS
    redirect_to subject_chapter_path(@material.chapter.subject, @material.chapter) if @material.destroy
  end

  private

  def material_params
    params.require(:material).permit(:name, :content, :subject_id, :chapter_id)
  end

  def authorize_material
    authorize @material
  end

  def set_material
    @material = Material.find(params[:id])
  end

  def set_subject_chapter
    @subject = Subject.find(params[:subject_id])
    @chapter = Chapter.find(params[:chapter_id])
  end
end
