require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get ne" do
    get sessions_ne_url
    assert_response :success
  end

end
