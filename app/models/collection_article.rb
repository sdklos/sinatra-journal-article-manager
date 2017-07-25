class CollectionArticle < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :collection
  belongs_to :article

end
