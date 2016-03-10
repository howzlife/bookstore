class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @books = Book.all
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def create
    @book = Book.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :release_year, :price, :description, :book_id, :image_url)
    end
end
