class ChangeAuthorNameToIdInArticles < ActiveRecord::Migration[5.0]
  def change
    add_column(:articles, :author_id, :integer)
    remove_column(:articles, :author_name, :string)
  end
end
