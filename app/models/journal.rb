class Journal < ActiveRecord::Base
  has_many :articles
  has_many :collections, through: :articles

end
