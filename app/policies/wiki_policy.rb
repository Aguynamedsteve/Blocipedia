class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def destroy
    destroy?
  end

  def edit
    update? 
  end

  def update
    user.present? && (record.user == user || user.role?(:admin))
    authorize @wiki
  end

  def create
    user.present?    
  end
end