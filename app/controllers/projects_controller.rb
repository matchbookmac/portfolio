class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(project_params[:profile_ids].first)
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Thanks for adding your project, #{@project.name}!"
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Thanks for updating your project, #{@project.name}!"
      redirect_to project_path(@project)
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
    params.require(:project).permit(:name, :description, :repo_URL, :URL, { category_ids: [] }, { profile_ids: [] })
  end
end
