class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  has_many :wikis
  has_many :collaborators
  before_create :set_role

  ROLES = %w[member admin]
  
  def role?(base_role)
    role == base_role.to_s
  end

private

  def set_role
    self.role = 'member'
  end
end


