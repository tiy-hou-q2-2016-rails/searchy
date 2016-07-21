require 'test_helper'

class EndpointsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get endpoints_new_url
    assert_response :success
  end

end
