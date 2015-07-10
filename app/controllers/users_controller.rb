class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Thanks for updating your user, #{@user.first_name}!"
      redirect_to user_path(@user)
    else
      render :edit
    end
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
