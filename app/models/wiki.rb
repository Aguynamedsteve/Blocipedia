class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators 

  #default_scope { order('title ASC') }
  scope :visible_to, ->(user) { user ? scoped : joins(:wiki).where('wiki.private' => false) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end
end
