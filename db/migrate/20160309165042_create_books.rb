class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :release_year
      t.string :author
      t.float :price
      t.text :description
      t.string :book_id
      t.string :image_url

      t.timestamps
    end
  end

end
