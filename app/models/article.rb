class Article < ActiveRecord::Base
  belongs_to :collection
  belongs_to :journal
  belongs_to :author

end
