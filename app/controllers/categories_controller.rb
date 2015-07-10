class CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
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
  end

  def update
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
    @category.destroy
    flash[:alert] = "#{@category.language} is gone!"
    redirect_to categories_path
  end

private

  def category_params
    params.require(:category).permit(:language, :description, { user_ids: [] })
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
