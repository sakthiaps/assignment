class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    followers = current_user.followers.map(&:associated_id)
    @tweets = Tweet.where(user_id: followers).order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(user_id: current_user.id, title: params[:title], content: params[:content])

    if tweet.save
      redirect_to action: :index
    end
  end

end
