class UsersController < ApplicationController
  def index
    #render "index"
  end
  
  def create
    hashed_password = BCrypt::Password.create(params[:pass])
    user = User.new(uid: params[:uid], pass: hashed_password)
    user.save
    redirect_to users_index_path
  end
end
