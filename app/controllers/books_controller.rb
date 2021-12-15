class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
    @authors = Author.all
    @categories = Category.all
    @libraries = Library.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Created successfully!'
    else
      render :new
    end
  end

  def edit
    @authors = Author.all
    @categories = Category.all
    @libraries = Library.all
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Delete successfully!'
  end

  private

  def book_params
    params.require(:book).permit(:title, :parution_date, :library_id, :category_id, :author_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
