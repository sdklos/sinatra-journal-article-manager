class CollectionJournal < ActiveRecord::Base
  belongs_to :collection
  belongs_to :journal

end