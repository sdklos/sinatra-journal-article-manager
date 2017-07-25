class Collection < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :name, :password

  has_secure_password

  has_many :collection_articles
  has_many :articles, through: :collection_articles
  has_many :journals, through: :articles
  has_many :authors, through: :articles

end
