class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    tweet = Tweet.new(message: params[:message], tdate: Time.current)
    if tweet.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end

#flash[:notice] = '1レコード追加しました'
#flash[:notice] = '1レコード削除しました'
