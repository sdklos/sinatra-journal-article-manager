class Collection < ActiveRecord::Base
  has_many :articles
  has_many :journals, through: :articles

end
