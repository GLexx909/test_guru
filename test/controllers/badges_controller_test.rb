require 'test_helper'

class BagdesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bagdes_index_url
    assert_response :success
  end

  test "should get show" do
    get bagdes_show_url
    assert_response :success
  end

  test "should get edit" do
    get bagdes_edit_url
    assert_response :success
  end

  test "should get update" do
    get bagdes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bagdes_destroy_url
    assert_response :success
  end

end
