class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table(:articles) do |t|
      t.integer :collection_id
      t.integer :journal_id
      t.string :title
      t.integer :year
    end
  end
end
