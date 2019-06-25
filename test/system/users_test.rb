require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  def setup
      @user = users(:one)
      log_in(@user)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "ユーザー一覧"
  end
  
  test "show user" do
    visit users_url
    click_on "#{@user.name}"
    assert_selector "h1", text: "マイページ"
  end

  test "show follow" do
    visit users_url
    click_on "#{@user.name}"
    click_on "followees"
    assert_selector "h1", text: "フォロー"
  end

  test "show follower" do
    visit users_url
    click_on "#{@user.name}"
    click_on "followers"
    assert_selector "h1", text: "フォロワー"
  end

end
