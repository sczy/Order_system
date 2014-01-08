require 'test_helper'

class FoodVendorsControllerTest < ActionController::TestCase
  setup do
    @food_vendor = food_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_vendor" do
    assert_difference('FoodVendor.count') do
      post :create, food_vendor: { food_id: @food_vendor.food_id, vendor_id: @food_vendor.vendor_id }
    end

    assert_redirected_to food_vendor_path(assigns(:food_vendor))
  end

  test "should show food_vendor" do
    get :show, id: @food_vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_vendor
    assert_response :success
  end

  test "should update food_vendor" do
    put :update, id: @food_vendor, food_vendor: { food_id: @food_vendor.food_id, vendor_id: @food_vendor.vendor_id }
    assert_redirected_to food_vendor_path(assigns(:food_vendor))
  end

  test "should destroy food_vendor" do
    assert_difference('FoodVendor.count', -1) do
      delete :destroy, id: @food_vendor
    end

    assert_redirected_to food_vendors_path
  end
end
