class AddBookTypeToBooks < ActiveRecord::Migration
  def change
  	  	remove_column :books, :item_type, :string
  	  	add_column :books, :book_type, :string
  end
end
