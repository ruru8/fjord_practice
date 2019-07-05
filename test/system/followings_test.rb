# frozen_string_literal: true

require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase
  def setup
    @user = users(:user1)
    @user3 = users(:user3)
    @user.follow(@user3)
    login_as(@user)
  end

  test "create a followings" do
    visit users_url
    click_on "鈴木"

    click_button "Follow"

    assert_text "follow"
  end

  test "destroy a followings" do
    visit users_url
    click_on "satou"

    click_on "Unfollow"
    assert_text "unfollow"
  end
end
