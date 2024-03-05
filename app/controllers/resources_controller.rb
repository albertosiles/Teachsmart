class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      redirect_to resource_path(@resource)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @resources = Resource.all
  end

  def show
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      redirect_to resource_path(@resource)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path, status: :see_other
  end

  private

    def resource_params
      params.require(:resource).permit(:title, :description, :subject, :grade, :category, :resource_type)
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end

end
