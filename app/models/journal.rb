class Journal < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :name

  has_many :articles
  has_many :collections, through: :articles
  has_many :authors, through: :articles

end
