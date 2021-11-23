class UsersController < ApplicationController

  def new
    @users = User.new
  end

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path
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
