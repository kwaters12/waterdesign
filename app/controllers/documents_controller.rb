class DocumentsController < ApplicationController
  
  def create
    @project = Project.find(session[:project_id])
    @document = @project.documents.new(params.require(:document).permit([:direct_upload_url, :user_id, :caption]))
    @document.user_id = current_user.id
    @document.save
    # render nothing: true
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update    
    @document = Document.find(params[:id])
    @project = @document.project
    if @document.update_attributes(params.require(:document).permit([:direct_upload_url, :user_id, :caption]))
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @project = @document.project
    if @document.destroy
      redirect_to project_path(@project, @document), notice: "Image deleted successfully."
    else
      redirect_to project_path(@project, @document), notice: "Could not delete this image."      
    end    
  end



end