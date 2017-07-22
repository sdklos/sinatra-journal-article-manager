class Article < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates_presence_of :name, :year

  belongs_to :collection
  belongs_to :journal
  belongs_to :author

end
