class ProfilesController < ApplicationController
  def show
    #This sets @user to a user based on their id
    @user = User.find(params[:id])
  end

  def index
    #This sets @users to every User in our database
    @users = User.all
  end

  def feed
    @tweets = Tweet.where("user_id in (?) OR user_id = ?",
    current_user.friend_ids, current_user).order('created_at DESC')
  end
# @tweets = Tweet.where --> Tweet.where is a query.
#
# user_id in (?) --> user_id is the column name. in specifies multiple records will be returned. (?) is an argument and it will take the first one we pass through it. In this instance it's current_user.friend_ids.
#
# user_id = ?  --> This is looking for one user_id. This will include the tweets from the current user because we pass current_user to it.

end
