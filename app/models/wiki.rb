class Wiki < ActiveRecord::Base
  belongs_to :User

  default_scope { order('title ASC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
end
