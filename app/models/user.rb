class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases, foreign_key: :buyer_id
  has_many :books, through: :purchases

	def get_cart_books
	  cart_ids = $redis.smembers "cart#{id}"
	  Book.find(cart_ids)
	end

	def cart_total_price
	  total_price = 0
	  get_cart_books.each { |book| total_price += book.strike_price }
	  total_price
	end

	def cart_count
	  $redis.scard "cart#{id}"
	end

	def purchase_cart_books!
	  get_cart_books.each { |book| purchase(book) }
	  $redis.del "cart#{id}"
	end

	def purchase(book)
	  books << book unless purchase?(book)
	end

	def purchase?(book)
	  books.include?(book)
	end

	def has_payment_info?
  		braintree_customer_id
	end
end
