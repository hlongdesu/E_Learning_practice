require "test_helper"

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get results_new_url
    assert_response :success
  end
end
