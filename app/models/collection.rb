class Collection < ActiveRecord::Base
  has_many :articles
  has_many :journals, through: :articles
  has_many :authors, through: :articles

end
