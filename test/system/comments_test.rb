# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  def setup
    @report = reports(:report1)
    @book = books(:book1)
    @comment = comments(:comment1)
    @user = users(:user1)
    login_as(@user)
  end

  test "visit the index in Books" do
    visit books_url
    first("tbody tr").click_on "Show"
    assert_selector "h2", text: "Comment"
  end

  test "visit the index in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"
    assert_selector "h2", text: "Comment"
  end

  test "create a comment in Books" do
    visit books_url
    first("tbody tr").click_on "Show"

    fill_in "comment[name]", with: @comment.name
    fill_in "comment[content]", with: @comment.content
    click_on "create"

    assert_text "create"
  end

  test "create a comment in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"

    fill_in "comment[name]", with: @comment.name
    fill_in "comment[content]", with: @comment.content
    click_on "create"

    assert_text "create"
  end

  test "destroy a comment in Books" do
    visit books_url
    first("tbody tr").click_on "Show"

    page.accept_confirm do
      click_on "[x]"
    end

    assert_text "destroyed"
  end

  test "destroy a comment in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"

    page.accept_confirm do
      click_on "[x]"
    end

    assert_text "destroyed"
  end
end
