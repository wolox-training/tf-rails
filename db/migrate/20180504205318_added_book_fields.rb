class AddedBookFields < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :genre, :string, null: false
    add_column :books, :author, :string, null: false
    add_column :books, :image, :string, null: false
    add_column :books, :title, :string, null: false
    add_column :books, :publisher, :string, null: false
    add_column :books, :year, :string, null: false
  end
end
