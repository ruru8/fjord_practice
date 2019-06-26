require 'test_helper'

class FollowingTest < ActiveSupport::TestCase

  def setup
    @following = Following.new(follower_id: users(:one).id,
                               followee_id: users(:two).id)
  end

  test "should be valid" do
    assert @following.valid?
  end

  test "should require a follower_id" do
    @following.follower_id = nil
    assert_not @following.valid?
  end

  test "should require a followee_id" do
    @following.followee_id = nil
    assert_not @following.valid?
  end
end
