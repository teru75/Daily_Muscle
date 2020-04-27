require 'test_helper'

class EventTemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_templates_index_url
    assert_response :success
  end
end
