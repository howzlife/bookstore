class Purchase < ActiveRecord::Base
	belongs_to :book
	belongs_to :buyer, class_name: 'User'
end
