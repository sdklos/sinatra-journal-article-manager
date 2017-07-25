class CreateCollectionArticles < ActiveRecord::Migration[5.0]
  def change
    create_table (:collection_articles) do |t|
      t.integer :collection_id
      t.integer :article_id
    end
  end
end
