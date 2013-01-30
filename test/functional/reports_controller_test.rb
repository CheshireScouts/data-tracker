require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get awards" do
    get :awards
    assert_response :success
  end

  test "should get membership" do
    get :membership
    assert_response :success
  end

end
