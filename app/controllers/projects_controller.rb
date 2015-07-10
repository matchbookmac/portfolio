class ProjectsController < AdminController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  before_filter :ensure_admin!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Thanks for adding your project, #{@project.name}!"
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
    if @project.update(project_params)
      flash[:notice] = "Thanks for updating your project, #{@project.name}!"
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
    @project.destroy
    flash[:alert] = "#{@project.name} is gone!"
    redirect_to projects_path
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :repo_URL, :URL, { category_ids: [] }, { user_ids: [] })
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
