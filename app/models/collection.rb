class Collection < ActiveRecord::Base
  validates :user_email, :password, presence: true

  has_many :articles
  has_many :journals, through: :articles
  has_many :authors, through: :articles



end
