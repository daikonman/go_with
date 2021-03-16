require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,  "go with"
    assert_equal full_title("Help"), "Help | go with"
  end
end