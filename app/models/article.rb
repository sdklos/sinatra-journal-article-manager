class Article < ActiveRecord::Base
  validates :title, :year, presence: true

  belongs_to :collection
  belongs_to :journal
  belongs_to :author

end
