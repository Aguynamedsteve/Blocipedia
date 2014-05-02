class WikisController < ApplicationController
  def index
    @wiki = Wiki.new
    @wikis = policy_scope(Wiki).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      render "new"
    end
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki

    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error saving. Please try again."
      render :edit
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    name = Wiki.name
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end



