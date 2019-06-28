# frozen_string_literal: true

require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = books(:book1)
  end

  test "title should be present" do
    @book.title = nil
    assert_not @book.valid?
  end
end
