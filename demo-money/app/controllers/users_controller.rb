class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.permission = 1
    @user.del = 0

    if @user.save
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:success] = "Register failed"
      puts '===>'
      puts @user.errors[:password]
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:fullname, :password, :password_confirmation, :email)
  end
end
