# frozen_string_literal: true

require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase
  def setup
    @user = users(:user1)
    @user3 = users(:user3)
    @user.follow(@user3)
    login_as(@user)
  end

  test "creating a followings" do
    visit users_url
    click_on "test2"

    click_button "Follow"

    assert_text "follow"
    click_on "Back"
  end

  test "destroying a followings" do
    visit users_url
    click_on "test3"

    click_on "Unfollow"
    assert_text "unfollow"
  end
end
