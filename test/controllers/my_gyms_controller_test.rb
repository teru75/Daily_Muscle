require 'test_helper'

class MyGymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_gyms_index_url
    assert_response :success
  end
end
