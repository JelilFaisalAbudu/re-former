class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      flash.now[:error] = 'Rats! Fix your mistakes, please.'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

<<<<<<< HEAD
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit
    end
  end

=======
>>>>>>> 84632d144915c1772222b606a4aed943b206b1c9
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
