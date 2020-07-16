class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to edit_user_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
