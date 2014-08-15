class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :find_project, except: [:index, :create, :new]

  def index
    @projects = Project.order("created_at DESC").all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params     
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

    Rails.logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    Rails.logger.info(session[:project_id])
    Rails.logger.info("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
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
    @project = Project.find(params[:id])
  end

end
