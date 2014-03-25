class DocumentsController < ApplicationController
  def create
    # Rails.logger.info ">>>>>>>>>>"
    # Rails.logger.info params
    # Rails.logger.info ">>>>>>>>>>"
    # Rails.logger.info params.require(:document).permit([:direct_upload_url])
    # Rails.logger.info ">>>>>>>>>>"
    @project = current_user.projects.find(session[:project_id])
    @document = @project.documents.new(params.require(:document).permit([:direct_upload_url, :user_id]))
    @document.user_id = current_user.id
    @document.save
    render nothing: true
  end
end