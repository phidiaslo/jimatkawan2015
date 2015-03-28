require 'test_helper'

class ShiplocationsControllerTest < ActionController::TestCase
  setup do
    @shiplocation = shiplocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shiplocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shiplocation" do
    assert_difference('Shiplocation.count') do
      post :create, shiplocation: { cost: @shiplocation.cost, country: @shiplocation.country, listing_id: @shiplocation.listing_id, price: @shiplocation.price }
    end

    assert_redirected_to shiplocation_path(assigns(:shiplocation))
  end

  test "should show shiplocation" do
    get :show, id: @shiplocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shiplocation
    assert_response :success
  end

  test "should update shiplocation" do
    patch :update, id: @shiplocation, shiplocation: { cost: @shiplocation.cost, country: @shiplocation.country, listing_id: @shiplocation.listing_id, price: @shiplocation.price }
    assert_redirected_to shiplocation_path(assigns(:shiplocation))
  end

  test "should destroy shiplocation" do
    assert_difference('Shiplocation.count', -1) do
      delete :destroy, id: @shiplocation
    end

    assert_redirected_to shiplocations_path
  end
end
