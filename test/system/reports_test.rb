# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  def setup
    @report = reports(:report1)
    @user = users(:user1)
    login_as(@user)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "creating a report" do
    visit reports_url
    click_on "New"

    fill_in "report[title]", with: @report.title
    fill_in "report[content]", with: @report.content
    click_on "create"

    assert_text "create"
  end

  test "updating a report" do
    visit reports_url
    first("tbody tr").click_on "Edit"

    fill_in "report[title]", with: @report.title
    fill_in "report[content]", with: @report.content

    click_on "update"

    assert_text "updated"
  end

  test "destroying a report" do
    visit reports_url
    page.accept_confirm do
      first("tbody tr").click_on "Delete"
    end

    assert_text "destroyed"
  end
end
