class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @books = Book.search(params[:search]).page
    respond_with(@books)
  end

  def show
    @book = Book.find(params[:id])
    @cart_action = @book.cart_action current_user.try :id    
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :release_year, :price, :description, :book_id, :image_url)
    end
end
