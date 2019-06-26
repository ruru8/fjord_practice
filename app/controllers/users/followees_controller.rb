class Users::FolloweesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followees
    render 'users/show_follow'
  end
end
