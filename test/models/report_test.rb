require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = reports(:one)
  end

  test "shoud be valid" do
    assert @report.valid?
  end

  test "title should be present" do
    @report.title = ""
    assert_not @report.valid?
  end
end