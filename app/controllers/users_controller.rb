class UsersController < ApplicationController

  def new
    @users = Book.new
  end

  def create
    @users = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @users = User.find(params[:id])
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
