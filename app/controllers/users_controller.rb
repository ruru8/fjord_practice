class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end

class Users::FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followings
    render 'users/show_follow'
  end
end

class Users::FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'users/show_follower'
  end
end
