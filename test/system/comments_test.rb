# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  def setup
    @report = reports(:one)
    @book = books(:one)
    @comment = comments(:one)
    @user = users(:one)
    login_as(@user)
  end

  test "visiting the index in Books" do
    visit books_url
    first("tbody tr").click_on "Show"
    assert_selector "h2", text: "Comment"
  end

  test "visiting the index in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"
    assert_selector "h2", text: "Comment"
  end

  test "creating a comment in Books" do
    visit books_url
    first("tbody tr").click_on "Show"

    fill_in "comment[name]", with: @comment.name
    fill_in "comment[content]", with: @comment.content
    click_on "create"

    assert_text "create"
    click_on "Back"
  end

  test "creating a comment in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"

    fill_in "comment[name]", with: @comment.name
    fill_in "comment[content]", with: @comment.content
    click_on "create"

    assert_text "create"
    click_on "Back"
  end

  test "destroying a comment in Books" do
    visit books_url
    first("tbody tr").click_on "Show"

    page.accept_confirm do
      click_on "[x]"
    end

    assert_text "destroyed"
  end

  test "destroying a comment in Reports" do
    visit reports_url
    first("tbody tr").click_on "Show"

    page.accept_confirm do
      click_on "[x]"
    end

    assert_text "destroyed"
  end
end
