require 'test_helper'

class CensusFormatsControllerTest < ActionController::TestCase
  setup do
    @census_format = census_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:census_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create census_format" do
    assert_difference('CensusFormat.count') do
      post :create, census_format: { name: @census_format.name, table_xpath: @census_format.table_xpath }
    end

    assert_redirected_to census_format_path(assigns(:census_format))
  end

  test "should show census_format" do
    get :show, id: @census_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @census_format
    assert_response :success
  end

  test "should update census_format" do
    put :update, id: @census_format, census_format: { name: @census_format.name, table_xpath: @census_format.table_xpath }
    assert_redirected_to census_format_path(assigns(:census_format))
  end

  test "should destroy census_format" do
    assert_difference('CensusFormat.count', -1) do
      delete :destroy, id: @census_format
    end

    assert_redirected_to census_formats_path
  end
end
