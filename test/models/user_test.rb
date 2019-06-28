# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
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
