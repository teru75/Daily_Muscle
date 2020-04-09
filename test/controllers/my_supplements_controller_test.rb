require 'test_helper'

class MySupplementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_supplements_index_url
    assert_response :success
  end

end
