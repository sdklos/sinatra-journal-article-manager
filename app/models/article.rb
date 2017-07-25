class Article < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :name, :year

  has_many :collection_articles
  has_many :collections, through: :collection_articles
  belongs_to :journal
  belongs_to :author

end
