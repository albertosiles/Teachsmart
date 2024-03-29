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
    @resources = @resources.with_subject(params[:subject])
    @resources = @resources.with_student_age(params[:student_age])
    @subjects = Resource.pluck(:subject).uniq
    @student_ages = Resource.pluck(:student_age).uniq.sort
  end

  def my_uploaded_resources
    @resources = current_user.resources
    render 'my_uploaded_resources'
  end


  def show
  end

  def edit
  end

  def update
    # raise
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
      params.require(:resource).permit(:title, :description, :subject, :student_age, :category, :resource_type, :file)
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end

end
