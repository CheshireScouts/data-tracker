require 'test_helper'

class MembershipTypesControllerTest < ActionController::TestCase
  setup do
    @membership_type = membership_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membership_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membership_type" do
    assert_difference('MembershipType.count') do
      post :create, membership_type: { name: @membership_type.name }
    end

    assert_redirected_to membership_type_path(assigns(:membership_type))
  end

  test "should show membership_type" do
    get :show, id: @membership_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membership_type
    assert_response :success
  end

  test "should update membership_type" do
    put :update, id: @membership_type, membership_type: { name: @membership_type.name }
    assert_redirected_to membership_type_path(assigns(:membership_type))
  end

  test "should destroy membership_type" do
    assert_difference('MembershipType.count', -1) do
      delete :destroy, id: @membership_type
    end

    assert_redirected_to membership_types_path
  end
end
