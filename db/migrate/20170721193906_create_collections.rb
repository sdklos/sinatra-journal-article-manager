class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table (:collections) do |t|
      t.string :password_digest
      t.string :user_email
    end
  end
end
