class Author < ActiveRecord::Base
  has_many :articles
  has_many :journals, through: :articles
  has_many :collections, through: :articles
end
