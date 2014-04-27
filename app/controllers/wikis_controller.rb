class WikisController < ApplicationController
  def index
    @wiki = Wiki.new
    @wikis = Wiki.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
     @wiki = Wiki.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      render "new"
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      flash[:error] = "Error saving. Please try again."
      render :edit
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    name = Wiki.name
    #authorize @wiki

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
    params.require(:wiki).permit(:title, :body)
  end

end



