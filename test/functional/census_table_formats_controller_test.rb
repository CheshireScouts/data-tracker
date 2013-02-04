require 'test_helper'

class CensusTableFormatsControllerTest < ActionController::TestCase
  setup do
    @census_table_format = census_table_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:census_table_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create census_table_format" do
    assert_difference('CensusTableFormat.count') do
      post :create, census_table_format: { column: @census_table_format.column, row: @census_table_format.row }
    end

    assert_redirected_to census_table_format_path(assigns(:census_table_format))
  end

  test "should show census_table_format" do
    get :show, id: @census_table_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @census_table_format
    assert_response :success
  end

  test "should update census_table_format" do
    put :update, id: @census_table_format, census_table_format: { column: @census_table_format.column, row: @census_table_format.row }
    assert_redirected_to census_table_format_path(assigns(:census_table_format))
  end

  test "should destroy census_table_format" do
    assert_difference('CensusTableFormat.count', -1) do
      delete :destroy, id: @census_table_format
    end

    assert_redirected_to census_table_formats_path
  end
end
