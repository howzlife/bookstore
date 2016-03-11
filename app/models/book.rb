class Book < ActiveRecord::Base
	def image
		self.image_url
	end

	def indigo
		self.indigo_link
	end
end
