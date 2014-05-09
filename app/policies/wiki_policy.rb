class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def new?
    user.present?    
  end

  def destroy?
    user.present? && (record.user == user || user.role?(:admin))
  end

  def edit?
    update?  
  end

  def update?
    user.present? 
  end

  def create?
    new?     
  end

  class Scope
    attr_reader :scope 

    def initialize(user, scope)
      @user = user
      @scope = scope
    end  
    
    def resolve
      scope.public_wikis
    end
  end
end