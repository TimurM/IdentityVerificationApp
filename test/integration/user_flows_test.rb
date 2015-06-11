require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "get to the form page" do
    https!
    get "/check_locations/new"
    assert_response :success

    post_via_redirect "/check_locations/new",
    first_name: users(:Kristy).first_name,
    last_name: users(:Kristy).last_name,
    ip_address: users(:Kristy).ip_address

    assert_response :success
  end
end
