class ProjectsController < ApplicationController
  before_action :set_user_ids, only: [:new, :edit]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    if project_params[:user_ids]
      @user = User.find(project_params[:user_ids].first)
    end
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
    @project = Project.find(params[:id])
  end

  def update
    if project_params[:user_ids]
      @user = User.find(project_params[:user_ids].first)
    end
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    @project.destroy
    flash[:alert] = "#{@project.name} is gone!"
    redirect_to projects_path
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :repo_URL, :URL, { category_ids: [] }, { user_ids: [] })
  end

  def set_user_ids
    # @user = User.find(params[:user_id])
  end
end
