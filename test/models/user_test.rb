# frozen_string_literal: true

require "test_helper"
require "minitest/autorun"
require "omniauth"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
    @user2 = users(:user2)
  end

  test "name should be present" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "profile should not be too long" do
    @user.profile = "a" * 201
    assert_not @user.valid?
  end

  test "user should be registered as it is when users have the same account as auth" do
    user = User.new(provider: "github", uid: "000")
    auth = User.find_for_github_oauth(user)
    assert @user == auth
  end

  test "user should be created when users don't have the same account as auth" do
    auth = OmniAuth::AuthHash.new(provider: "github",
                                  uid: "123",
                                  info: { name: "tanaka" })
    user = User.find_for_github_oauth(auth)
    assert user == User.find(user.id)
  end

  test "emaill should be created using uid and prober" do
    auth = users(:user_github)
    auth_email = User.dummy_email(auth)
    assert_equal "12345-github@example.com", auth_email
  end

  test "user should be added to followees" do
    @user.follow(@user2)
    assert @user.followees.include?(@user2)
  end

  test "user should be deleted from followees" do
    @user.followees << @user2
    @user.unfollow(@user2)
    assert_not @user.followees.include?(@user2)
  end

  test "should return true if user is in followees" do
    @user.followees << @user2
    assert_equal @user.following?(@user2), true
  end
end
