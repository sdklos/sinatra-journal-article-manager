class Author < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :first_name, :last_name

  has_many :articles
  has_many :journals, through: :articles
  has_many :collections, through: :articles

  def name
    "#{self.first_name + " " + self.last_name}"
  end
end
