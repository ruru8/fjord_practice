require "application_system_test_case"

class FollowingsTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    @user3 = users(:three)
    @user.follow(@user3)
    log_in(@user)
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

    click_on 'Unfollow'
    assert_text "unfollow"
  end
end
