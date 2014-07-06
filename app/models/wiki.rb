class Wiki < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators 

  #u.wikis.includes(:collaborators).where("collaborators.user_id" => u.id)
  #scope :visible_to, ->(user) { user ? scoped : joins(:wiki).where('wiki.private' => false) }
  scope :public_wikis, -> { where(Wiki.arel_table[:private].eq(false).or(Wiki.arel_table[:private].eq(nil))) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]



  def should_generate_new_friendly_id?
    new_record?
  end
end
