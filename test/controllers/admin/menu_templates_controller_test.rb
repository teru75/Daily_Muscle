require 'test_helper'

class Admin::MenuTemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_menu_templates_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_menu_templates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_menu_templates_destroy_url
    assert_response :success
  end

end
