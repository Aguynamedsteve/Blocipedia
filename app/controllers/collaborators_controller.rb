class CollaboratorsController < ApplicationController

  def index
    @collaborators = Collaborator.all 
  end

  def new
    @collaborators = Collaborator.new
    @users = User.all
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params.require(:collaborator).permit(:user_id, :id))
    
    if @collaborator.save
      flash[:notice] = "Collaborator saved."
    else
      flash[:error] = "Unable to save. Please try again."
    end
    redirect_to action: :new
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator sremoved."
    else
      flash[:error] = "There was an error removing collaborator. Please try again."
    end
    redirect_to action: :new
  end
end