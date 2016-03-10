class EditColumnsInBooks < ActiveRecord::Migration
  def change
  	remove_column :books, :book_id, :string
  	remove_column :books, :description, :text
  	add_column :books, :product_savings, :string
  	add_column :books, :indigo_link, :string
  	add_column :books, :item_type, :string
  	add_column :books, :availability_value, :string
  	add_column :books, :strike_price, :float
  	add_column :books, :prominent_price, :float
  end
end
