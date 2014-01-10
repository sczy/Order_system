require 'test_helper'

class VendorRolesControllerTest < ActionController::TestCase
  setup do
    @vendor_role = vendor_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_role" do
    assert_difference('VendorRole.count') do
      post :create, vendor_role: { role: @vendor_role.role, vendor_id: @vendor_role.vendor_id }
    end

    assert_redirected_to vendor_role_path(assigns(:vendor_role))
  end

  test "should show vendor_role" do
    get :show, id: @vendor_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_role
    assert_response :success
  end

  test "should update vendor_role" do
    put :update, id: @vendor_role, vendor_role: { role: @vendor_role.role, vendor_id: @vendor_role.vendor_id }
    assert_redirected_to vendor_role_path(assigns(:vendor_role))
  end

  test "should destroy vendor_role" do
    assert_difference('VendorRole.count', -1) do
      delete :destroy, id: @vendor_role
    end

    assert_redirected_to vendor_roles_path
  end
end
