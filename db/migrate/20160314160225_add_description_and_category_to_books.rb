class AddDescriptionAndCategoryToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :description, :text
  	add_column :books, :category, :string
  end
end
