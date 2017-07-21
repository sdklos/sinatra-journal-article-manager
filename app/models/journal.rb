class Journal < ActiveRecord::Base
  has_many :articles
  has_many :collections, through: :articles
  has_many :authors, through: :articles

end
