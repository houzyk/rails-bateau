class SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject)
  end

  def show
    @subject = Subject.find(params[:id])
    authorize @subject
  end
end
