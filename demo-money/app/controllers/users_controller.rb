class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.permission = 1 // duy: magic number => use constant variable
    @user.del = 0 // duy: default value => set default column value in database

    if @user.save
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:success] = "Register failed" // duy: flash[:error]
      puts '===>' // duy: remove comment
      puts @user.errors[:password]// duy: remove comment
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:fullname, :password, :password_confirmation, :email)
  end
end
