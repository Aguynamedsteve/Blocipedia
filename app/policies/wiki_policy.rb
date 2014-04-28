class WikiPolicy < ApplicationPolicy

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
end