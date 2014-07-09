class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :wikis
  has_many :wikis
  has_many :collaborators
  has_many :collaborations, through: :collaborators, source: :wiki
  before_create :set_role

  mount_uploader :avatar, AvatarUploader

  ROLES = %w[member admin premium]
  
  def role?(base_role)
    role == base_role.to_s
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      #user.oauth_token = auth.credentials.token
      #user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save(:validate => false)
    end
  end

private

  def set_role
    self.role = 'member'
  end
end


