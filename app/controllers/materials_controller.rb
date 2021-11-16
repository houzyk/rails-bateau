class MaterialsController < ApplicationController
  def show
    @material = Material.find(params[:chapter_id])
    authorize @material
  end

  def new
    @subject = Subject.find(params[:subject_id])
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.new(chapter_params)
    @subject = Subject.find(params[:subject_id])
    @material.subject = @subject
    if @material.save
      redirect_to subject_path(@subject)
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
    if @material.update(chapter_params)
      redirect_to subject_path(@material.subject)
    else
      render :edit
    end
    authorize @material
  end

  def destroy
    @material = Material.find(params[:id])
    # ! INSERT AN IF TO CHECK FOR POTENTIAL ERROS
    redirect_to subject_path(@material.subject) if @material.destroy
    authorize @material
  end

  private

  def chapter_params
    params.require(:material).permit(:title, :description, :subject_id)
  end
end
