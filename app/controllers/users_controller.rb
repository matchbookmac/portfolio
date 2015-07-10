class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # binding.pry
    # if request.path == "users/"
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:notice] = "Thanks for adding your user, #{@user.first_name}!"
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Thanks for updating your user, #{@user.first_name}!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "We are sorry to see you go :("
    redirect_to users_path
  end
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :github_URL)
  end
end
