require 'test_helper'

class FoodRolesControllerTest < ActionController::TestCase
  setup do
    @food_role = food_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_role" do
    assert_difference('FoodRole.count') do
      post :create, food_role: { food_id: @food_role.food_id, role: @food_role.role }
    end

    assert_redirected_to food_role_path(assigns(:food_role))
  end

  test "should show food_role" do
    get :show, id: @food_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_role
    assert_response :success
  end

  test "should update food_role" do
    put :update, id: @food_role, food_role: { food_id: @food_role.food_id, role: @food_role.role }
    assert_redirected_to food_role_path(assigns(:food_role))
  end

  test "should destroy food_role" do
    assert_difference('FoodRole.count', -1) do
      delete :destroy, id: @food_role
    end

    assert_redirected_to food_roles_path
  end
end
