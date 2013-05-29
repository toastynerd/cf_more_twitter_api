require 'resque'
require 'resque_scheduler'
require 'resque/scheduler'
class TweetsController < ApplicationController
  Resque.redis = ENV["REDIS_SERVER"]
  before_filter :find_tweet, :only => [:show, :edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params[:tweet])
    if @tweet.save
      Resque.enqueue_at(@tweet.post_at, SendToTwitter, @tweet.id, current_user.id)
      flash[:notice]= "Tweet has been created."
      redirect_to @tweet
    else
      flash[:notice]="Tweet could not be created."
      render :action => "new"
    end
  end

  def show
    #
  end

private
  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

end
