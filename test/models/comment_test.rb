# frozen_string_literal: true

require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @book_comment = comments(:comment1)
    @report_comment = comments(:comment2)
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
