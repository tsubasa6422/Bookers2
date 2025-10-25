class BooksController < ApplicationController

  
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render "books/index"
    end
  end

  def index 
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def edit
   
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book has been deleted."
    redirect_to books_path
  end


  
  private

  def set_book
    @book = Book.find(params[:id])
  end

  def correct_user
    return if @book.user == current_user
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title,:opinion)
  end
end
