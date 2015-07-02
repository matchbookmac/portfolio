class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(category_params[:profile_ids].first)
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Thanks for adding #{@category.language}, to your categories, #{@profile.first_name}!"
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:profile_id])
    @category = Category.find(params[:id])
  end

  def update
    @profile = Profile.find(category_params[:profile_ids].first)
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Thanks for updating your category, #{@category.language}!"
      redirect_to profile_path(@profile)
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
    params.require(:category).permit(:language, :description, { profile_ids: [] })
  end
end
