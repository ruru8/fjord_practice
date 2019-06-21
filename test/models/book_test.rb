require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
  end

  test "shoud be valid" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = ""
    assert_not @book.valid?
  end
end

