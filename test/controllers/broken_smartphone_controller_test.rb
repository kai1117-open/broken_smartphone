require "test_helper"

class BrokenSmartphoneControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get broken_smartphone_top_url
    assert_response :success
  end
end
