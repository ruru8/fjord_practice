class Users::FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'users/show_follower'
  end
end
