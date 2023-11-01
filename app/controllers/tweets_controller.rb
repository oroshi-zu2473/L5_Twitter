class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
  end
  
  def create
    user_id = session[:user_id]
    
    tweet = Tweet.new(message: params[:message], tdate: Time.current, user_id: user_id)
    if tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
  
  
end