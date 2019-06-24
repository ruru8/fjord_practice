require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @book_comment = comments(:one)
    @report_comment = comments(:two)
  end

  test "shoud be valid by Book" do
    assert @book_comment.valid?
  end

  test "shoud be valid by Report" do
    assert @report_comment.valid?
  end

  test "name shoud be valid by Book" do
    @book_comment.name = nil
    assert_not @book_comment.valid?
  end

  test "name shoud be valid by Report" do
    @report_comment.name = nil
    assert_not @report_comment.valid?
  end

end
