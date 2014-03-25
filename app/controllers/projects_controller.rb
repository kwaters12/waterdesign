class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_project, except: [:index, :create, :new]

  def index
    @projects = Project.page(params[:page]).per_page(10)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new project_params     
    # @project.document = @project.documents.create!(params.require(:document).permit([:direct_upload_url]))
    # render nothing: true
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    session[:project_id] = @project.id
  end

  def edit
    
  end

  def project_params
    params.require(:project).permit([:title, :body, :project_type, :client, :tech, :link])
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
    @project = current_user.projects.find(params[:id])
  end

end
