class WikisController < ApplicationController
  def index
    @wiki = Wiki.new
    @wikis = current_user.wikis
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
     @wiki = current_user.wikis.build(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to wikis_path#, flash[:notice] = "Wiki was saved."
    else
      render "new"
    end
  end

  def update
  end

  def edit
  end

  def delete
  end

private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end



