class AddDetailsToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column(:articles, :details, :text)
  end
end
