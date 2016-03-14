# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
CSV.foreach(Rails.root.join("db/books.csv"), headers: true) do |row|
  Book.find_or_create_by(product_savings: row[1], image_url: row[2], 
  	title: row[3], indigo_link: row[4], author: row[5], book_type: row[6], availability_value: row[7], 
  	strike_price: row[8], prominent_price: row[10], release_year: row[11], category: row[12], description: row[13])
end