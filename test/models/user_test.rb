require 'test_helper'
require 'minitest/autorun'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "shoud be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "profile should not be too long" do
    @user.profile = "a" * 201
    assert_not @user.valid?
  end
end
