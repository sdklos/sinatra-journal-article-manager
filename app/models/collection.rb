class Collection < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :name, :password

  has_secure_password

  has_many :articles
  has_many :journals, through: :articles
  has_many :authors, through: :articles

end
