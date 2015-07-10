class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:alert] = "We are sorry to see you go :("
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :github_URL)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
