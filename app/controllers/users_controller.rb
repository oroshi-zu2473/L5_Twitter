class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
  end
  
  def create
    if User.exists?(uid: params[:uid])
      flash[:alert] = '※そのユーザIDは使えんでぇ～'
      redirect_to new_user_path
    else
      hashed_password = BCrypt::Password.create(params[:pass])
      user = User.new(uid: params[:uid], pass: hashed_password)
      user.save
      redirect_to users_path
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end