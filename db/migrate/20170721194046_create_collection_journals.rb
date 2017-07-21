class CreateCollectionJournals < ActiveRecord::Migration[5.0]
  def change
    create_table(:collection_journals) do |t|
      t.integer :collection_id
      t.integer :journal_id
    end
  end
end
