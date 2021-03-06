# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  def setup
    @book = books(:book1)
    @user = users(:user1)
    login_as(@user)
  end

  test "visit the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "create a Book" do
    visit books_url
    click_on "New"

    fill_in "book[title]", with: @book.title
    fill_in "book[memo]", with: @book.memo
    click_on "create"

    assert_text "create"
  end

  test "update a Book" do
    visit books_url
    first("tbody tr").click_on "Edit"

    fill_in "book[title]", with: @book.title
    fill_in "book[memo]", with: @book.memo

    click_on "update"

    assert_text "updated"
  end

  test "destroy a Book" do
    visit books_url
    page.accept_confirm do
      first("tbody tr").click_on "Delete"
    end

    assert_text "destroyed"
  end
end
