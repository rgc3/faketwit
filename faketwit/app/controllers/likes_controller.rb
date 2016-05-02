class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    @tweet.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to request.referrer }
    end
  end
  # @tweet.likes.where(user_id: current_user.id).first_or_create
  # This is saying return the first user with these arguments. If it doesn't exist create it with the same arguments. Remember @tweet is being set with the before_action and def set_tweet.



  def destroy
    @tweet.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to request.referrer }
    end
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
