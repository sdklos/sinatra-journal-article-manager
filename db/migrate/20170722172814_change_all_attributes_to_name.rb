class ChangeAllAttributesToName < ActiveRecord::Migration[5.0]
  def change
    add_column(:collections, :name, :string)
    remove_column(:collections, :user_email, :string)
    add_column(:articles, :name, :string)
    remove_column(:articles, :title, :name)
  end
end
