# frozen_string_literal: true

class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_to user, notice: t("follow")
  end

  def destroy
    user = Following.find(params[:id]).followee
    current_user.unfollow(user)
    redirect_to user, notice: t("unfollow")
  end
end
