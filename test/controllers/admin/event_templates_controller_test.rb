require 'test_helper'

class Admin::EventTemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_event_templates_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_event_templates_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_event_templates_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_templates_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_templates_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_event_templates_update_url
    assert_response :success
  end
end
