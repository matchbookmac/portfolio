class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = "Thanks for adding your profile, #{@profile.first_name}!"
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end
private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end
end
