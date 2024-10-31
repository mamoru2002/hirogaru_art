class UsersController < ApplicationController
  def new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user  # プロフィールページなどにリダイレクト
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
