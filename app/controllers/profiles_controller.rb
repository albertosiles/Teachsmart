class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy
    redirect_to root_path, notice: 'Profile was successfully deleted.'
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :description, :photo)
  end
end
