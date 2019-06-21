require 'test_helper'
require 'minitest/autorun'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "shoud be valid" do
    @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "profile should not be too long" do
    @user.name = "a" * 201
    assert_not @user.valid?
  end
end
