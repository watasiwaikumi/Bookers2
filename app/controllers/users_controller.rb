class UsersController < ApplicationController
 before_action :authenticate_user!
  def new
    @users = User.new
  end

  def index
    @users = User.all
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
