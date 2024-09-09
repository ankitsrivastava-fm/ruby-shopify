require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stores_new_url
    assert_response :success
  end

  test "should get create" do
    get stores_create_url
    assert_response :success
  end

  test "should get show" do
    get stores_show_url
    assert_response :success
  end
end
