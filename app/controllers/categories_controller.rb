class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new

  end

  def create

binding.pry
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Thanks for adding #{@category.language}, to your categories!"
      if @user
        redirect_to user_path(@user)
      else
        redirect_to users_path
      end
    else
      render :new
    end
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
    @category = Category.find(params[:id])
  end

  def update
    if category_params[:user_ids]
      @user = User.find(category_params[:user_ids].first)
    end
    @category = Category.find(params[:id])
    if @category.update(category_params)
        flash[:notice] = "Thanks for updating your category, #{@category.language}!"
      if @user
        redirect_to user_path(@user)
      else
        redirect_to users_path
      end
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "#{@category.language} is gone!"
    redirect_to categories_path
  end
private
  def category_params
    params.require(:category).permit(:language, :description, { user_ids: [] })
  end
end
