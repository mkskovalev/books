class BooksController < ApplicationController
  before_action :find_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: 'New book successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path, notice: 'Book successfully deleted.'
    else
      redirect_to books_path, notice: 'Something went wrong. Book didnt delete.'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :date)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
