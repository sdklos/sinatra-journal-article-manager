class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :articles
  has_many :journals, through: :articles
  has_many :collections, through: :articles
end
