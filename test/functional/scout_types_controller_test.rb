require 'test_helper'

class ScoutTypesControllerTest < ActionController::TestCase
  setup do
    @scout_type = scout_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scout_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scout_type" do
    assert_difference('ScoutType.count') do
      post :create, scout_type: { code: @scout_type.code, name: @scout_type.name }
    end

    assert_redirected_to scout_type_path(assigns(:scout_type))
  end

  test "should show scout_type" do
    get :show, id: @scout_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scout_type
    assert_response :success
  end

  test "should update scout_type" do
    put :update, id: @scout_type, scout_type: { code: @scout_type.code, name: @scout_type.name }
    assert_redirected_to scout_type_path(assigns(:scout_type))
  end

  test "should destroy scout_type" do
    assert_difference('ScoutType.count', -1) do
      delete :destroy, id: @scout_type
    end

    assert_redirected_to scout_types_path
  end
end
