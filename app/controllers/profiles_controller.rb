class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    # binding.pry
    # if request.path == "profiles/"
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

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "Thanks for updating your profile, #{@profile.first_name}!"
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:alert] = "We are sorry to see you go :("
    redirect_to profiles_path
  end
private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio)
  end
end
