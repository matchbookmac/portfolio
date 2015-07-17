class UsersController < AdminController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
    @reference = Relationship.new
  end

  def destroy
    @user.destroy
    flash[:alert] = "We are sorry to see you go :("
    redirect_to users_path
  end

private

  def set_user
    @user = User.find(params[:id])
  end
end
