class ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :create, :new]

  def index
    @projects = Project.page(params[:page]).per_page(10)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def project_params
    params.require(:project).permit([:title, :body, :image])
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project Deleted Successfully"
    else
      redirect_to projects_path, notice: "Hey man, don't delete your buddy's project."      
    end    
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

end
