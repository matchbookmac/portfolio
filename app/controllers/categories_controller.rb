class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    if params[:profile_id]
      @profile = Profile.find(params[:profile_id])
    end
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    if params[:profile_id]
      @profile = Profile.find(params[:profile_id])
    end
  end

  def create
    if category_params[:profile_ids]
      @profile = Profile.find(category_params[:profile_ids].first)
    end
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Thanks for adding #{@category.language}, to your categories!"
      if @profile
        redirect_to profile_path(@profile)
      else
        redirect_to profiles_path
      end
    else
      render :new
    end
  end

  def edit
    if params[:profile_id]
      @profile = Profile.find(params[:profile_id])
    end
    @category = Category.find(params[:id])
  end

  def update
    if category_params[:profile_ids]
      @profile = Profile.find(category_params[:profile_ids].first)
    end
    @category = Category.find(params[:id])
    if @category.update(category_params)
        flash[:notice] = "Thanks for updating your category, #{@category.language}!"
      if @profile
        redirect_to profile_path(@profile)
      else
        redirect_to profiles_path
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
    params.require(:category).permit(:language, :description, { profile_ids: [] })
  end
end
