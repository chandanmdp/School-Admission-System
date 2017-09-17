require 'test_helper'

class EligibilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eligibilities_index_url
    assert_response :success
  end

  test "should get new" do
    get eligibilities_new_url
    assert_response :success
  end

  test "should get edit" do
    get eligibilities_edit_url
    assert_response :success
  end

end
